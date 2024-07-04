import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tp1_flutter/Task/task.dart';




CollectionReference<TODOTask> getTaskCollection(){
  return FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('tasks')
      .withConverter<TODOTask>(
      fromFirestore: (doc, _) => TODOTask.fromJson(doc.data()!),
  toFirestore: (task, _) => task.toJson());
}

// CollectionReference<> getPhotoCollection(){
//   return FirebaseFirestore.instance
//       .collection('users')
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .collection('tasks')
//       .withConverter<Task>(
//       fromFirestore: (doc, _) => Task.fromJson(doc.data()!),
//       toFirestore: (task, _) => task.toJson());
// }


//SIGNIN USER
Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}


//CREATE TASK
Future<void> addTask(String pName, Timestamp pDeadline) async {

  //get task collection from current user
  CollectionReference<TODOTask> tasksCollection = getTaskCollection();

  Timestamp now = Timestamp.now();
  
  DateTime today = now.toDate();
  
  DateTime dateMod = DateTime(today.year, today.month, today.day, 0,0,0,0,0);

  //make a task with the params and default values
  TODOTask task = TODOTask(id : "", name: pName, creationDate: Timestamp.fromDate(dateMod), deadline: pDeadline, progress: 0, photoURL: "");

  //add the task made to the collection
  tasksCollection.add(task);

  QuerySnapshot<TODOTask> tasksSnap = await getTaskCollection().get();

  var taskId = tasksSnap.docs.where((element) => element.data().name == task.name).first.id;

  TODOTask newTask = TODOTask(id: taskId, name: task.name, creationDate: task.creationDate, deadline: task.deadline, progress: 0, photoURL: "");

  DocumentReference<TODOTask> taskDoc = tasksCollection.doc(taskId);

  taskDoc.set(newTask);



}


//GET ALL TASKS FROM USER
Future<List<TODOTask>> getAllTasks() async {

  List<TODOTask> tasklist = [];

  //get task collection from current user
  CollectionReference<TODOTask> tasksCollection = getTaskCollection();

  QuerySnapshot<TODOTask> tasksSnap = await tasksCollection.get();

  for(var task in tasksSnap.docs){

    tasklist.add(task.data());
  }

  return await tasklist;


}


//GET SPECIFIC TASK FROM USER
Future<TODOTask?> getOneTask(String pTaskId) async {

  //get task collection from current user
  DocumentReference<TODOTask> taskDoc = getTaskCollection().doc(pTaskId);

  DocumentSnapshot<TODOTask> snap = await taskDoc.get();

  TODOTask? detailTask = await snap.data();


  return detailTask;
}


//EDIT SPECIFIC TASK PROGRESS
Future<void> editTask(String pTaskId, int pNewProgress, TODOTask pOldTask) async{

  //get task collection from current user
  CollectionReference<TODOTask> tasksCollection = getTaskCollection();

  //get the task with id specified in params
  DocumentReference<TODOTask> taskDoc = tasksCollection.doc(pTaskId);

  //make a task with the params (need old task to retrieve former info)
  TODOTask task = TODOTask(id: pTaskId, name: pOldTask.name, creationDate: pOldTask.creationDate, deadline: pOldTask.deadline, progress: pNewProgress, photoURL: pOldTask.photoURL);

  //edit task : change its progress with the one in params
  taskDoc.set(task);

}



//SEND IMAGE
Future<void> sendImg(File imgFile, TODOTask task) async{
  var ref = FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).collection('photo');
  DocumentReference imgDoc = await ref.add({
    'url' : "",

  });

  Reference imgRef = FirebaseStorage.instance.ref(imgDoc.id);

  await imgRef.putFile(imgFile);

  String url = await imgRef.getDownloadURL();

  imgDoc.update({
    "url" : url
  });

  DocumentReference<TODOTask> taskDoc = getTaskCollection().doc(task.id);

  //make a task with the params (need old task to retrieve former info)
  TODOTask taskWithPhoto = TODOTask(id: task.id, name: task.name, creationDate: task.creationDate, deadline: task.deadline, progress: task.progress, photoURL : url);

  //edit task : change its progress with the one in params
  taskDoc.set(taskWithPhoto);
  
}



