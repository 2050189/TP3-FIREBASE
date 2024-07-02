import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tp1_flutter/Task/task.dart';




CollectionReference<Task> getTaskCollection(){
  return FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('tasks')
      .withConverter<Task>(
      fromFirestore: (doc, _) => Task.fromJson(doc.data()!),
  toFirestore: (task, _) => task.toJson());
}


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
Future<void> addTask(String pName, DateTime pDeadline) async {

  //get task collection from current user
  CollectionReference<Task> tasksCollection = getTaskCollection();

  //make a task with the params and default values
  Task task = Task(name: pName, creationDate: DateTime.now(), deadline: pDeadline, progress: 0, photoId: 0);

  //add the task made to the collection
  tasksCollection.add(task);

}


//GET ALL TASKS FROM USER
Future<Stream<QuerySnapshot<Object?>>?> getAllTasks() async {

}


//GET SPECIFIC TASK FROM USER
Future<Task?> getOneTask() async {

  //get task collection from current user
  CollectionReference<Task> tasksCollection = getTaskCollection();
 return "";
}

editTask(String pTaskId, int pNewProgress, Task pOldTask){

  //get task collection from current user
  CollectionReference<Task> tasksCollection = getTaskCollection();

  //get the task with id specified in params
  DocumentReference taskDoc = tasksCollection.doc(pTaskId);

  //make a task with the params (need old task to retrieve former info)
  Task task = Task(name: pOldTask.name, creationDate: pOldTask.creationDate, deadline: pOldTask.deadline, progress: pNewProgress, photoId: pOldTask.photoId);

  //edit task : change its progress with the one in params
  taskDoc.set(task);

}