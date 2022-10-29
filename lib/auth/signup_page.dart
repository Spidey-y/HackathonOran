// ignore_for_file: prefer_const_constructors, unused_local_variable, duplicate_ignore

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/home.dart';
import 'package:quickalert/quickalert.dart';
import '/Theme/alerts.dart';
import '/Theme/theme.dart';
import '../Theme/buttons.dart';
import '../Theme/fields.dart';
// import '../models/providers.dart';
// import 'home.dart';
import 'signin_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController maladieController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  // String gender = "Sexe";
  int i = 0;
  @override
  void dispose() {
    passwordController.dispose();
    addressController.dispose();
    maladieController.dispose();
    phoneController.dispose();
    prenomController.dispose();
    nomController.dispose();
    emailController.dispose();
    conPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              if (i == 0) {
                Navigator.pop(context);
              } else {
                setState(() {
                  i--;
                });
              }
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).primaryColor,
              size: 30,
            )),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: AutoSizeText(
                  "Welcome to Revive",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: AutoSizeText(
                  "Please provice the following information.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: secondaryColor.withOpacity(0.7),
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    i == 0
                        ? InputField(
                            controller: nomController,
                            icon: Icons.person,
                            hint: "Family name",
                            keyboard: TextInputType.name,
                            isPass: false)
                        : InputField(
                            controller: addressController,
                            icon: Icons.location_on,
                            hint: "Address",
                            keyboard: TextInputType.streetAddress,
                            isPass: false),
                    // Container(
                    //     margin: const EdgeInsets.only(top: 5, bottom: 25),
                    //     width: MediaQuery.of(context).size.width * 0.4,
                    //     padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(10),
                    //         border: Border.all(
                    //             width: 1,
                    //             color: secondaryColor.withOpacity(0.55))),
                    //     child: DropdownButton<String>(
                    //       isExpanded: true,
                    //       hint: const Text(
                    //         "Sexe",
                    //         style: TextStyle(fontSize: 18),
                    //       ),
                    //       value: gender,
                    //       alignment: AlignmentDirectional.center,
                    //       elevation: 3,
                    //       iconSize: 30,
                    //       underline: SizedBox(),
                    //       items: <String>["Sexe", 'Homme', 'Femme']
                    //           .map((String value) {
                    //         return DropdownMenuItem<String>(
                    //           value: value,
                    //           child: AutoSizeText(
                    //             value,
                    //             style: const TextStyle(fontSize: 18),
                    //           ),
                    //         );
                    //       }).toList(),
                    //       onChanged: (x) {
                    //         setState(() {
                    //           gender = x!;
                    //         });
                    //       },
                    //     ),
                    //   ),

                    i == 0
                        ? InputField(
                            controller: prenomController,
                            icon: Icons.person,
                            hint: "First name",
                            keyboard: TextInputType.name,
                            isPass: false)
                        : SizedBox(),
                    i == 0
                        ? InputField(
                            controller: emailController,
                            icon: Icons.email,
                            hint: "E-mail",
                            keyboard: TextInputType.emailAddress,
                            isPass: false)
                        : InputField(
                            controller: passwordController,
                            icon: Icons.key,
                            hint: "Password",
                            keyboard: TextInputType.visiblePassword,
                            isPass: true),
                    i == 0
                        ? SizedBox()
                        : InputField(
                            controller: conPasswordController,
                            icon: Icons.key,
                            hint: "Confirm password",
                            keyboard: TextInputType.visiblePassword,
                            isPass: true),
                    i == 0
                        ? InputField(
                            controller: phoneController,
                            icon: Icons.phone,
                            hint: "Phone number",
                            keyboard: TextInputType.phone,
                            isPass: false)
                        : SizedBox()
                  ],
                )),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: i == 0
                  ? Button(
                      color: Theme.of(context).primaryColor,
                      text: 'next',
                      textColor: Colors.white,
                      x: () {
                        if (!_formKey.currentState!.validate()) {
                          return snack(
                              context, "Please fill in all the fields");
                        }
                        setState(() {
                          i++;
                        });
                      })
                  : FormButton(
                      formKey: _formKey,
                      color: Theme.of(context).primaryColor,
                      text: "Sign Up",
                      textColor: Colors.white,
                      x: (context) async {
                        if (passwordController.text !=
                            conPasswordController.text) {
                          return snack(context, "Passwords don't match");
                        }
                        var isGo = false;
                        QuickAlert.show(
                                onConfirmBtnTap: () async {
                                  isGo = true;
                                },
                                title: "",
                                context: context,
                                confirmBtnText: "Confirmer",
                                cancelBtnText: "Annuler",
                                type: QuickAlertType.info,
                                text:
                                    "Veuillez patienter pendant que nous créons votre compte"
                                // "Veuillez prendre deux photos de votre carte Chifa (recto et verso)."
                                )
                            .then((value) async {
                          if (isGo) {
                            UserCredential y;
                            try {
                              y = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim());
                              await FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(y.user!.uid.toString())
                                  .set({
                                "token": "",
                                "score": 0,
                                "firstName": prenomController.text.trim(),
                                "phoneNumber": phoneController.text.trim(),
                                "familyName": nomController.text.trim(),
                                "email": emailController.text.trim(),
                                "address": addressController.text.trim(),
                                "id": y.user!.uid,
                              });
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ));
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                snack(context,
                                    'Le mot de passe fourni est trop faible.');
                              } else if (e.code == 'email-already-in-use') {
                                snack(context,
                                    "Le compte existe déjà pour cet email.");
                              }
                              return;
                            }
                          }
                        });

                        // await signInFunc(
                        //     context, emailController.text, passwordController.text);
                      }),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButon(
                context: context,
                route: const SignInPage(),
                leading: "Vous avez déjà un compte ?",
                button: "Se connecter"),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
