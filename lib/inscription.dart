// import 'dart:html';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:tp1_flutter/DTOs/transfer.dart';
import 'package:tp1_flutter/accueil.dart';
import 'package:tp1_flutter/connexion.dart';

import 'generated/l10n.dart';
import 'http.dart';
import 'main.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}


class _InscriptionState extends State<Inscription> {




  final TextEditingController pseudo = TextEditingController();
  final TextEditingController mdp = TextEditingController();
  final TextEditingController conf = TextEditingController();


  @override
  Widget build(BuildContext context) {

    ProgressDialog pd = ProgressDialog(context: context);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation){
          if(orientation == Orientation.portrait){
            return Column(
                children: <Widget>[
                  Expanded( // Deco card
                    flex: 5,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                color: MyColorScheme.myPrimaryColor,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(400, 100))
                            ),

                            child: Column(
                              children: [
                                Expanded(
                                  flex: 11,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.deepOrangeAccent,
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(300, 80))
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 10,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: MyColorScheme.mySecondaryColor,
                                                borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(300, 80))
                                            ),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 9,
                                                  child: Container(
                                                    width: double.maxFinite,
                                                    decoration: BoxDecoration(
                                                        color: MyColorScheme.myTertiaryColor,
                                                        borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(300, 80))
                                                    ),
                                                    child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            S.of(context).welcomeReg, textAlign: TextAlign.center, style: MyTypography.myDisplayStyleDark,
                                                          ),
                                                          Text(S.of(context).instructionReg, textAlign: TextAlign.center, style: MyTypography.myBodyStyleDark,)
                                                        ]
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(// form
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 250,
                              width: 350,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [ // TODO : RECHECK FIELDS
                                  TextFormField(
                                    controller: pseudo,
                                    decoration: InputDecoration(
                                      hintStyle: MyTypography.myHintStyle,
                                      labelStyle: MyTypography.myLabelStyle,
                                      labelText: S.of(context).username,
                                      border: OutlineInputBorder(),
                                      hintText: S.of(context).hintUsername,
                                    ),
                                  ),
                                  TextFormField(
                                    controller: mdp,
                                    decoration: InputDecoration(
                                      hintStyle: MyTypography.myHintStyle,
                                      labelStyle: MyTypography.myLabelStyle,
                                      labelText: S.of(context).password,
                                      border: OutlineInputBorder(),
                                      hintText: S.of(context).hintPassword,

                                    ),

                                    obscureText: true,
                                  ),
                                  TextFormField(
                                    controller: conf,
                                    decoration: InputDecoration(
                                      hintStyle: MyTypography.myHintStyle,
                                      labelStyle: MyTypography.myLabelStyle,
                                      labelText: S.of(context).confirmPassword,
                                      border: OutlineInputBorder(),
                                      hintText: S.of(context).hintConf,
                                    ),
                                    obscureText: true,
                                  ),

                                ],
                              ),


                            )
                          ],
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            OutlinedButton(onPressed: () {
                              NavigationHelper().home(context);
                            }, child: Text(S.of(context).existingAccount, style: MyTypography.myBtnTextStyle)),
                            FilledButton(onPressed: () async {

                              pd.show(msg: S.of(context).loading, barrierColor: MyColorScheme.myBarrierColor);

                              if(pseudo.text.length < 2){
                                pd.close();
                                Fluttertoast.showToast(msg: S.of(context).usernameTooShort, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
                                return;
                              }

                              if(mdp.text.length < 4){
                                pd.close();
                                Fluttertoast.showToast(msg: S.of(context).psswdTooShort, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
                                return;
                              }

                              if(mdp.text != conf.text){
                                pd.close();
                                Fluttertoast.showToast(msg: S.of(context).psswdDiff, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
                                return;
                              }

                              Object? response = await Register(new SignupRequest(username: pseudo.text, password: mdp.text));
                              if(response == "UsernameAlreadyTaken"){
                                print("je test!!!");
                                Fluttertoast.showToast(msg: S.of(context).usernameTaken, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
                                return;
                              }

                              if(response == "connection problem"){
                                print("connexion kapout!!!");
                                Fluttertoast.showToast(msg: S.of(context).noNetwork, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
                                return;
                              }
                              pd.close();
                              NavigationHelper().navigateTo(context, Accueil());
                            }, child: Text(S.of(context).signup, style: MyTypography.myBtnTextStyle))
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        )
                      ],

                    ),
                  ),
                ]
            );
          }else{
            return SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                  children: <Widget>[
                    Container(
                      height: 500,
                      child: Column(
                        children: [
                          Expanded( // Deco card
                            flex: 5,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: MyColorScheme.myPrimaryColor,
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(400, 100))
                                    ),

                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 11,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.deepOrangeAccent,
                                                borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(300, 80))
                                            ),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 10,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: MyColorScheme.mySecondaryColor,
                                                        borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(300, 80))
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Expanded(
                                                          flex: 9,
                                                          child: Container(
                                                            width: double.maxFinite,
                                                            decoration: BoxDecoration(
                                                                color: MyColorScheme.myTertiaryColor,
                                                                borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(300, 80))
                                                            ),
                                                            child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Text(
                                                                    S.of(context).welcomeReg, textAlign: TextAlign.center, style: MyTypography.myDisplayStyleDark,
                                                                  ),
                                                                  Text(S.of(context).instructionReg, textAlign: TextAlign.center, style: MyTypography.myBodyStyleDark,)
                                                                ]
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(// form
                            flex: 6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 250,
                                      width: 350,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [ // TODO : RECHECK FIELDS
                                          TextFormField(
                                            controller: pseudo,
                                            decoration: InputDecoration(
                                              hintStyle: MyTypography.myHintStyle,
                                              labelStyle: MyTypography.myLabelStyle,
                                              labelText: S.of(context).username,
                                              border: OutlineInputBorder(),
                                              hintText: S.of(context).hintUsername,
                                            ),
                                          ),
                                          TextFormField(
                                            controller: mdp,
                                            decoration: InputDecoration(
                                              hintStyle: MyTypography.myHintStyle,
                                              labelStyle: MyTypography.myLabelStyle,
                                              labelText: S.of(context).password,
                                              border: OutlineInputBorder(),
                                              hintText: S.of(context).hintPassword,

                                            ),

                                            obscureText: true,
                                          ),
                                          TextFormField(
                                            controller: conf,
                                            decoration: InputDecoration(
                                              hintStyle: MyTypography.myHintStyle,
                                              labelStyle: MyTypography.myLabelStyle,
                                              labelText: S.of(context).confirmPassword,
                                              border: OutlineInputBorder(),
                                              hintText: S.of(context).hintConf,
                                            ),
                                            obscureText: true,
                                          ),

                                        ],
                                      ),


                                    )
                                  ],
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    OutlinedButton(onPressed: () {
                                      NavigationHelper().home(context);
                                    }, child: Text(S.of(context).existingAccount, style: MyTypography.myBtnTextStyle)),
                                    FilledButton(onPressed: () async {

                                      pd.show(msg: S.of(context).loading, barrierColor: MyColorScheme.myBarrierColor);

                                      if(pseudo.text.length < 2){
                                        pd.close();
                                        Fluttertoast.showToast(msg: S.of(context).usernameTooShort, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
                                        return;
                                      }

                                      if(mdp.text.length < 4){
                                        pd.close();
                                        Fluttertoast.showToast(msg: S.of(context).psswdTooShort, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
                                        return;
                                      }

                                      if(mdp.text != conf.text){
                                        pd.close();
                                        Fluttertoast.showToast(msg: S.of(context).psswdDiff, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
                                        return;
                                      }

                                      Object? response = await Register(new SignupRequest(username: pseudo.text, password: mdp.text));
                                      if(response == "UsernameAlreadyTaken"){
                                        print("je test!!!");
                                        Fluttertoast.showToast(msg: S.of(context).usernameTaken, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
                                        return;
                                      }

                                      if(response == "connection problem"){
                                        print("connexion kapout!!!");
                                        Fluttertoast.showToast(msg: S.of(context).noNetwork, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
                                        return;
                                      }
                                      pd.close();
                                      NavigationHelper().navigateTo(context, Accueil());
                                    }, child: Text(S.of(context).signup, style: MyTypography.myBtnTextStyle))
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                )
                              ],

                            ),
                          ),
                        ],
                      ),
                    )

                  ]
              ),
            );
          }
        }
      ),
        resizeToAvoidBottomInset: false// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
