import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:tp1_flutter/DTOs/transfer.dart';
import 'package:tp1_flutter/accueil.dart';
import 'package:tp1_flutter/main.dart';

import 'generated/l10n.dart';
import 'http.dart';

class Creation extends StatefulWidget {
  const Creation({super.key});

  @override
  State<Creation> createState() => _CreationState();
}

class _CreationState extends State<Creation> {

  final TextEditingController nomTask = TextEditingController();

  DateTime selectedDate = DateTime.now();

  String formattedDate = "";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(), // limite inf de date
        lastDate: DateTime(2101)); // limite sup de date
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formattedDate = selectedDate.day.toString() +"/"+ selectedDate.month.toString() +"/"+ selectedDate.year.toString();
      });
    }
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
                    "Salut, "+
                        SingletonDIO.pseudoSingleton+"!",
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
                    await Logout();
                    pd.close();
                    await NavigationHelper().home(context);
                  }
                  ,
                )
              ]
          )
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          height: 550,
          margin: EdgeInsets.fromLTRB(10, 30, 10, 80),
          padding: EdgeInsets.fromLTRB(15, 30, 15, 30),
          decoration: BoxDecoration(
            color: MyColorScheme.myAccentColorPale,
            borderRadius: BorderRadius.circular(20),
              border: Border.all(color: MyColorScheme.myAccentColor)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                S.of(context).createTask, textAlign: TextAlign.center, style: MyTypography.myHeadingStyle,
              ),
              TextFormField(
                controller: nomTask,
                decoration: InputDecoration(
                    hintStyle: MyTypography.myHintStyle,
                    labelStyle: MyTypography.myLabelStyle,
                    labelText: S.of(context).nameTask,
                    border: OutlineInputBorder(
                    ),
                    hintText:  S.of(context).hintUsername,
                    fillColor: Colors.white,
                    filled: true
                ),
              ),
              OutlinedButton(onPressed: () => _selectDate(context), child:
              Text(
                S.of(context).selectDate, style: MyTypography.myBodyStyle,
              )),
              Text(formattedDate, style: MyTypography.myBodyStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  TextButton(onPressed: (){
                    NavigationHelper().navigateTo(context, Accueil());
                  }, child: Text(S.of(context).back, style: MyTypography.myBodyStyle,)),
                  ElevatedButton(onPressed: () async{
                    pd.show(msg: S.of(context).loading, barrierColor: MyColorScheme.myBarrierColor);
                    Object? response = await CreateTask(new AddTaskRequest(name: nomTask.text, deadline: selectedDate));

                    if(response == "Existing"){
                      print("je test!!!");
                      pd.close();
                      Fluttertoast.showToast(msg: S.of(context).tasknameTaken, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
                      return;
                    }

                    if(response == "Empty"){
                      print("je test!!!");
                      pd.close();
                      Fluttertoast.showToast(msg: S.of(context).tasknameEmpty, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
                      return;
                    }

                    if(response == "TooShort"){
                      print("je test!!!");
                      pd.close();
                      Fluttertoast.showToast(msg: S.of(context).tasknameTooShort, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
                      return;
                    }

                    if(response == "connection problem"){
                      print("connexion kapout!!!");
                      pd.close();
                      Fluttertoast.showToast(msg: S.of(context).noNetwork, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
                      return;
                    }
                    pd.close();
                    pd.close();
                    NavigationHelper().navigateTo(context, Accueil());
                  }, child: Text(
                    S.of(context).create, style: MyTypography.myBodyStyleLight,
                  ))
                ],
              )

            ],
          ),
        ),
      ),
        resizeToAvoidBottomInset: false// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}