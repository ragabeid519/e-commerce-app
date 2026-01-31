import 'package:fire_base_project2/components/custombuttonauth.dart';
import 'package:fire_base_project2/components/customlogoauth.dart';
import 'package:fire_base_project2/components/textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../components/bottomNavBar.dart';
import '../generated/l10n.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  // Future<UserCredential> signInWithGoogle() async {
  Future signInWithGoogle(BuildContext context) async {
    GoogleSignIn.instance.initialize(
      serverClientId:
          '736908291694-n53e852j1r9dqd5ht2fh2h23bq5o2q5o.apps.googleusercontent.com',
    );
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount googleUser = await GoogleSignIn.instance
          .authenticate();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      Get.offNamedUntil('/home', (route) => false);
    } catch (e) {
      // function add

      Get.snackbar(
        S.of(context).error,
        S.of(context).cancelled,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottomnavbar(pageIndex: 0),
      appBar: AppBar(title: Text(S.of(context).login), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Form(
              key: formstate,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 24,
                children: [
                  const CustomLogoAuth(),
                  Text(
                    S.of(context).login,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    S.of(context).login_subtitle,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    S.of(context).email,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  CustomTextForm(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return S.of(context).field_required;
                      }
                      return null;
                    },
                    hinttext: S.of(context).enter_your_email,
                    mycontroller: email,
                  ),
                  Text(
                    S.of(context).password,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  CustomTextForm(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return S.of(context).field_required;
                      }
                      return null;
                    },
                    hinttext: S.of(context).enter_your_password,
                    mycontroller: password,
                  ),
                  InkWell(
                    onTap: () async {
                      try {
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                          email: email.text.trim(),
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(S.of(context).user_not_found),
                              );
                            },
                          );
                        } else if (e.code == 'wrong-password') {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(S.of(context).wrong_password),
                              );
                            },
                          );
                        } else {
                          print('========Error during password reset: $e');
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(S.of(context).error),
                              );
                            },
                          );
                        }
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                      alignment: Alignment.topRight,
                      child: Text(
                        S.of(context).forgot_password,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomButtonAuth(
              title: S.of(context).login,
              onPressed: () async {
                if (formstate.currentState!.validate()) {
                  final userEmail = email.text.trim();
                  final userPassword = password.text.trim();
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: userEmail,
                      password: userPassword,
                    );
                    if (FirebaseAuth.instance.currentUser!.emailVerified) {
                      Navigator.of(context).pushReplacementNamed('/home');
                    } else {
                      FirebaseAuth.instance.currentUser!
                          .sendEmailVerification();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(S.of(context).verify_email),
                            content: Text(
                              S.of(context).please_verify_your_email,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(S.of(context).ok),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  } on FirebaseAuthException catch (e) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(S.of(context).error),
                          content: Text("${S.of(context).error_ms}=== ${e}"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(S.of(context).ok),
                            ),
                          ],
                        );
                      },
                    );
                    if (e.code == 'user-not-found') {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(S.of(context).error),
                            content: Text(S.of(context).user_not_found),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(S.of(context).ok),
                              ),
                            ],
                          );
                        },
                      );
                    } else if (e.code == 'wrong-password') {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(S.of(context).error),
                            content: Text(S.of(context).wrong_password),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(S.of(context).ok),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                } else {
                  print("not valid");
                }
              },
            ),

            MaterialButton(
              height: 40,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () {
                signInWithGoogle(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(S.of(context).sign_in_with_google),
                  Image.asset("assets/images/4.png", width: 20),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("/signup");
              },
              child: Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: S.of(context).dont_have_an_account),
                      TextSpan(
                        text: S.of(context).signup,
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
