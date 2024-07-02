import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


CollectionReference tasksCollection = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection('tasks');

Future<UserCredential> signInWithGoogle() async { //SIGNIN USER
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

Future<void> addTask(String name, DateTime creationDate, DateTime deadline) async {

  tasksCollection.add({
    'name' : name,
    'creationDate' : creationDate,
    'deadline' : deadline,
    'progress' : 0,
    'photoId' : 0
  });

}

Future<Stream<QuerySnapshot>> getAllTasks() async {

  var res = await tasksCollection.snapshots();

  return res;
}

Future<Object> getOneTask() async {
 return "";
}