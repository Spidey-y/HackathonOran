// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Theme/alerts.dart';
import '../Theme/buttons.dart';
import '../Theme/fields.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(
            height: 100,
          ),
          SizedBox(
              height: MediaQuery.of(context).size.width * 0.4,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Center(
                  child: Image.network(
                "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                fit: BoxFit.contain,
              ))),
          const SizedBox(
            height: 60,
          ),
          Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InputField(
                      controller: emailController,
                      icon: Icons.email,
                      hint: "E-mail",
                      keyboard: TextInputType.emailAddress,
                      isPass: false),
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: FormButton(
                formKey: _formKey,
                color: Theme.of(context).primaryColor,
                text: "Envoyer e-mail ",
                textColor: Colors.white,
                x: (context) async {
                  try {
                    await FirebaseAuth.instance.sendPasswordResetEmail(
                        email: emailController.text.trim());
                    snack(context, "Email Sent.");
                  } catch (e) {
                    snack(context, "Courriel non trouvé.");
                    return;
                  }
                  Navigator.pop(context);
                  // await signInFunc(
                  //     context, emailController.text, passwordController.text);
                }),
          )
        ],
      ),
    );
  }
}
