import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/auth/reset_password.dart';
import 'package:hackathon/home.dart';

import '../Theme/alerts.dart';
import '../Theme/buttons.dart';
import '../Theme/fields.dart';
import 'signup_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 20,
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
              height: 40,
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
                    InputField(
                        controller: passwordController,
                        icon: Icons.key,
                        hint: "Password",
                        keyboard: TextInputType.visiblePassword,
                        isPass: true)
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: FormButton(
                  formKey: _formKey,
                  color: Theme.of(context).primaryColor,
                  text: "Sign in",
                  textColor: Colors.white,
                  x: (context) async {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim());
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        snack(context,
                            "Aucun utilisateur trouvé pour cet email.");
                      } else if (e.code == 'wrong-password') {
                        snack(context,
                            "Mot de passe erroné fourni pour cet utilisateur.");
                      }
                      return;
                    }
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  }),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButon(
                context: context,
                route: const SignUpPage(),
                leading: "Don't have an account ?",
                button: "Create one"),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 15,
            ),
            TextButon(
                context: context,
                route: const ResetPassword(),
                leading: "",
                button: "Recover password"),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
