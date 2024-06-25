import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:tp1_flutter/accueil.dart';
import 'package:tp1_flutter/creation.dart';
import 'package:tp1_flutter/inscription.dart';
import 'package:tp1_flutter/main.dart';

import 'DTOs/transfer.dart';
import 'generated/l10n.dart';
import 'http.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {

  final TextEditingController pseudoConnexion = TextEditingController();
  final TextEditingController mdpConnexion = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseAuth.instance
  //       .authStateChanges()
  //       .listen((User? user) {
  //     if (user == null) {
  //       print('User is currently signed out!');
  //     } else {
  //       print('User is signed in! ' + user.email!);
  //     }
  //   }
  //   );
  //
  // }

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
        builder: (context, orientation)
        {
          if(orientation == Orientation.portrait){

            return SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                height: 800,
                child: Column(
                    children: <Widget>[
                      buildDecoCard(context),
                      Expanded( // form
                        flex: 6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buildFields(context, 250, 350)
                              ],
                            ),
                            Row(
                              children: buildButtons(),
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            )

                          ],

                        ),
                      ),
                    ]
                ),
              ),
            );
          }
          else{
            return SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                height: 500,
                child: Column(
                    children: <Widget>[
                      buildDecoCard(context),
                      Expanded( // form
                        flex: 6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buildFields(context, 150, 350),
                              ],
                            ),
                            Column(
                              children: buildButtons(),
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            )

                          ],

                        ),
                      ),
                    ]
                ),
              ),
            );
          }
        }

      ),
        resizeToAvoidBottomInset: false// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  SizedBox buildFields(BuildContext context, double h, double w) {
    return SizedBox(
                            height: h,
                            width: w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [ // TODO : RECHECK FIELDS
                                TextFormField(
                                  controller: pseudoConnexion,
                                  decoration: InputDecoration(
                                    hintStyle: MyTypography.myHintStyle,
                                    labelStyle: MyTypography.myLabelStyle,
                                    labelText: S.of(context).username,
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                TextFormField(
                                  controller: mdpConnexion,
                                  decoration: InputDecoration(
                                    hintStyle: MyTypography.myHintStyle,
                                    labelStyle: MyTypography.myLabelStyle,
                                    labelText: S.of(context).password,
                                    border: OutlineInputBorder(),

                                  ),

                                  obscureText: true,
                                ),

                              ],
                            ),


                          );
  }

  List<Widget> buildButtons() {
    return [
      OutlinedButton(onPressed: () {
        NavigationHelper().navigateTo(context, Inscription());
      }, child: Text(S.of(context).noAccount, style: MyTypography.myBtnTextStyle)),

      FilledButton(onPressed: () async {
        await signInWithGoogle();
      }, child: Row(
        children: [
          Icon(Icons.mail_outline), Text("Google sign in" ,style: MyTypography.myBtnTextStyle)
        ],
      ))
      // FilledButton(onPressed: () async {
      //
      //   ProgressDialog pd = ProgressDialog(context: context);
      //
      //   pd.show(msg: S.of(context).loading, barrierColor: MyColorScheme.myBarrierColor);
      //   Object? response = await Login(new SigninRequest(username: pseudoConnexion.text, password: mdpConnexion.text));
      //
      //   if(response == "InternalAuthenticationServiceException"){
      //     print("je test!!!");
      //     pd.close();
      //     Fluttertoast.showToast(msg: S.of(context).usernameNotFound, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
      //     return;
      //   }
      //
      //   if(response == "BadCredentialsException"){
      //     print("je test!!!");
      //     pd.close();
      //     Fluttertoast.showToast(msg: S.of(context).psswdInc, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
      //     return;
      //   }
      //
      //   if(response == "connection problem"){
      //     print("connexion kapout!!!");
      //     pd.close();
      //     Fluttertoast.showToast(msg: S.of(context).noNetwork, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
      //     return;
      //   }
      //   pd.close();
      //
      //   NavigationHelper().navigateTo(context, Accueil());
      // }, child: Text(S.of(context).login, style: MyTypography.myBtnTextStyle))
    ];
  }

  Expanded buildDecoCard(BuildContext context) {
    return Expanded( // Deco card
                  flex: 5,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: MyColorScheme.myTertiaryColor,
                              borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(400, 100))
                          ),

                          child: Column(
                            children: [
                              Expanded(
                                flex: 11,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:  MyColorScheme.mySecondaryColor,
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(300, 80))
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 10,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.deepOrangeAccent,
                                              borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(300, 80))
                                          ),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                flex: 9,
                                                child: Container(
                                                  width: double.maxFinite,
                                                  decoration: BoxDecoration(
                                                      color:  MyColorScheme.myPrimaryColor,
                                                      borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(300, 80))
                                                  ),
                                                  child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                            S.of(context).helloLog, textAlign: TextAlign.center, style: MyTypography.myDisplayStyleLight
                                                        ),
                                                        Text(S.of(context).instructionLog, textAlign: TextAlign.center, style: MyTypography.myBodyStyleLight,)
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
                );
  }
}
