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
Future<void> addTask(String pName, Timestamp pDeadline) async {

  //get task collection from current user
  CollectionReference<Task> tasksCollection = getTaskCollection();

  Timestamp now = Timestamp.now();
  
  DateTime today = now.toDate();
  
  DateTime dateMod = DateTime(today.year, today.month, today.day, 0,0,0,0,0);

  //make a task with the params and default values
  Task task = Task(id : "", name: pName, creationDate: Timestamp.fromDate(dateMod), deadline: pDeadline, progress: 0, photoId: 0);

  //add the task made to the collection
  tasksCollection.add(task);

  QuerySnapshot<Task> tasksSnap = await getTaskCollection().get();

  var taskId = tasksSnap.docs.where((element) => element.data().name == task.name).first.id;

  Task newTask = Task(id: taskId, name: task.name, creationDate: task.creationDate, deadline: task.deadline, progress: 0, photoId: 0);

  DocumentReference<Task> taskDoc = tasksCollection.doc(taskId);

  taskDoc.set(newTask);



}


//GET ALL TASKS FROM USER
Future<List<Task>> getAllTasks() async {

  List<Task> tasklist = [];

  //get task collection from current user
  CollectionReference<Task> tasksCollection = getTaskCollection();

  QuerySnapshot<Task> tasksSnap = await tasksCollection.get();

  for(var task in tasksSnap.docs){

    tasklist.add(task.data());
  }

  return tasklist;


}


//GET SPECIFIC TASK FROM USER
Future<Task?> getOneTask(String pTaskId) async {

  //get task collection from current user
  DocumentReference<Task> taskDoc = getTaskCollection().doc(pTaskId);

  DocumentSnapshot<Task> snap = await taskDoc.get();

  Task? detailTask = await snap.data();


  return detailTask;
}

Future<void> editTask(String pTaskId, int pNewProgress, Task pOldTask) async{

  //get task collection from current user
  CollectionReference<Task> tasksCollection = getTaskCollection();

  //get the task with id specified in params
  DocumentReference<Task> taskDoc = tasksCollection.doc(pTaskId);

  //make a task with the params (need old task to retrieve former info)
  Task task = Task(id: pTaskId, name: pOldTask.name, creationDate: pOldTask.creationDate, deadline: pOldTask.deadline, progress: pNewProgress, photoId: pOldTask.photoId);

  //edit task : change its progress with the one in params
  taskDoc.set(task);

}