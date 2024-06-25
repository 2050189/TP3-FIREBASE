import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

class Testpage extends StatefulWidget {
  const Testpage({super.key});

  @override
  State<Testpage> createState() => _TestpageState();
}

class _TestpageState extends State<Testpage> {



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
                      await NavigationHelper().navigateTo(context, Testpage());
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
        body: Column(

    )
    );

  }
}
