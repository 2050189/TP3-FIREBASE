

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:tp1_flutter/http.dart';

import 'DTOs/transfer.dart';
import 'creation.dart';
import 'details.dart';
import 'generated/l10n.dart';
import 'main.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {

  List listeTask = [];

  CollectionReference tasksCollection = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection('tasks');

  getAllTask() async {

    ProgressDialog pd = ProgressDialog(context: context);
    SchedulerBinding.instance.addPostFrameCallback((_) => pd.show(msg: S.of(context).loading, barrierColor: MyColorScheme.myBarrierColor));
    var res = await tasksCollection.get();
    var tasksDocs = res.docs;

    setState(() {

    });

    pd.close();

    listeTask = tasksDocs.toList();
    if(listeTask.isEmpty){
      Fluttertoast.showToast(msg: S.of(context).toastFirstTask, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
    }
  }

  int calculTimeLeft(Timestamp creationDate, Timestamp deadline) {

    DateTime today = DateTime.now();

    DateTime dateDeadline = deadline.toDate();

    DateTime dateCreation = creationDate.toDate();

    Duration taskDuration = dateDeadline.difference(dateCreation);

    Duration durationLeft = dateDeadline.difference(today);

    int percentage = ((100*durationLeft.inSeconds)/taskDuration.inSeconds).toInt();

    if(percentage < 0){
      percentage = 0;
    }

    return percentage;

  }

  String transformTimestamp(Timestamp time){

    DateTime deadlineDate = time.toDate();

    String day = deadlineDate.day.toString();
    String month = deadlineDate.month.toString();
    String year = deadlineDate.year.toString();

    return day + "/" + month +"/"+year;
  }

  void initFirebase() async{
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    // TODO: implement initState
    initFirebase();

    getAllTask();
  }

  @override
  Widget build(BuildContext context) {

    ProgressDialog pd = ProgressDialog(context: context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
        DrawerHeader(
        decoration: BoxDecoration(
          color: MyColorScheme.myPrimaryColor,
        ),
        child: Text(
          ((FirebaseAuth.instance.currentUser)?.displayName.toString() == null ? "" : S.of(context).hiUser((FirebaseAuth.instance.currentUser)!.displayName.toString())),
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
            ListTile(
              title: Text(S.of(context).home),
              onTap: () async {
                await NavigationHelper().navigateTo(context, Accueil());
              }
              ,
            ),
            ListTile(
              title: Text(S.of(context).createTask),
              onTap: () async{
                await NavigationHelper().navigateTo(context, Creation());
              }
              ,
            ),
            ListTile(
              title: Text(S.of(context).logout),
              onTap: () async {
                pd.show(msg: S.of(context).loading, barrierColor: MyColorScheme.myBarrierColor);
                await GoogleSignIn().signOut();
                await FirebaseAuth.instance.signOut();
                setState(() {});
                pd.close();
                await NavigationHelper().home(context);
              }
              ,
            )
      ]
        )
      ),
      body: RefreshIndicator(
        child:
          ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: listeTask.length,
              itemBuilder: (context, index){
                return Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), // Add border radius here
                    color: MyColorScheme.myAccentColorPale,
                  ),
                  child: ListTile(
                    leading: SizedBox(
                      height: 50,
                      width: 50,
                      child: /*(listeTask[index].photoId ==0)*/ (1==1)? //TODO : MANAGE PICTURES
                      Icon(Icons.image_not_supported) :
                      CachedNetworkImage(
                        imageUrl: "http://10.0.2.2:8080/file/${listeTask[index].photoId}?width=100",
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    title: Text(
                        (listeTask[index]['name']).toString(), style: MyTypography.myHeadingStyle
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            transformTimestamp(listeTask[index]['deadline']),
                            style: MyTypography.mySmallTextStyle
                        ),
                        Text(
                            (S.of(context).percTimeSpent(calculTimeLeft(listeTask[index]['creationDate'], listeTask[index]['deadline']).toString())), style: MyTypography.mySmallTextStyle //TODO : CALCULATE TIME SPENT
                        )
                      ],
                    ),
                    trailing: Text(
                        (S.of(context).percDone(listeTask[index]['progress']).toString()), style: MyTypography.myLabelStyle
                    ),
                    onTap: () => NavigationHelper().navigateTo(context, Details(taskid: listeTask[index].id, timeSpentTask: calculTimeLeft(listeTask[index]['creationDate'], listeTask[index]['deadline']),)),
                ),
                );
              },


          ),
        onRefresh: (){
          return getAllTask();
        }

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigationHelper().navigateTo(context, Creation());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
        resizeToAvoidBottomInset: false// This trailing comma makes auto-formatting nicer for build methods.
    );

  }
}
