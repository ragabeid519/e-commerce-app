import 'package:fire_base_project2/components/custombuttonauth.dart';
import 'package:fire_base_project2/components/customlogoauth.dart';
import 'package:fire_base_project2/components/textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/bottomNavBar.dart';
import '../generated/l10n.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).signup)),
      bottomNavigationBar: Bottomnavbar(pageIndex: 0),
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
                    S.of(context).signup,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    S.of(context).signup_subtitle,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    S.of(context).username,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  CustomTextForm(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return S.of(context).field_required;
                      }
                      return null;
                    },
                    hinttext: S.of(context).enter_your_username,
                    mycontroller: username,
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
                  Center(
                    child: CustomButtonAuth(
                      title: S.of(context).signup,
                      onPressed: () async {
                        if (formstate.currentState!.validate()) {
                          try {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                  email: email.text,
                                  password: password.text,
                                );
                            Navigator.of(
                              context,
                            ).pushReplacementNamed('/login');
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(S.of(context).error),
                                    content: Text(S.of(context).weak_password),
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
                            } else if (e.code == 'email-already-in-use') {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(S.of(context).error),
                                    content: Text(S.of(context).account_exists),
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
                          } catch (e) {
                            print(
                              ' Error during sign up: $e =================',
                            );
                            SnackBar(
                              content: Text(
                                "==Error during sign up: $e =================",
                              ),
                            );
                          }
                        } else {
                          print('not valid');
                        }
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("/login");
                    },
                    child: Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: S.of(context).already_have_an_account,
                            ),
                            TextSpan(
                              text: S.of(context).login,
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
          ],
        ),
      ),
    );
  }
}
