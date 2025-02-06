import 'package:chat_app2/Components/custom_button.dart';
import 'package:chat_app2/Components/custom_text_field.dart';
import 'package:chat_app2/Screens/chatPage.dart';
import 'package:chat_app2/Screens/constants.dart';
import 'package:chat_app2/helper/show-snack-bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  static String id = 'registerPage';

  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLoading = false;
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(height: 75),
                Image.asset('assets/images/scholar.png', height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Scholar Chat',
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60),
                Row(
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomTextField(
                  onChanged: (data) {
                    email = data.trim();
                  },
                  hintText: 'Email',
                ),
                SizedBox(height: 15),
                CustomTextField(
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                ),
                SizedBox(height: 20),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() => isLoading = true);
                      try {
                        await userRegister();
                        Navigator.pushNamed(context, 'Chat Page',arguments: email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == "weak-password") {
                          ShowSnakBar(context, 'Weak Password');
                        } else if (e.code == "email-already-in-use") {
                          ShowSnakBar(context, 'Email is already in use');
                        } else if (e.code == "invalid-email") {
                          ShowSnakBar(context, 'Invalid email format');
                        } else {
                          ShowSnakBar(context, 'Error: ${e.message}');
                        }
                      } catch (ex) {
                        ShowSnakBar(context, 'There was an error');
                      }
                      setState(() => isLoading = false);
                    }
                  },
                  text: 'Register',
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        '  Login.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> userRegister() async {
    if (email == null || password == null || email!.isEmpty || password!.isEmpty) {
      ShowSnakBar(context, 'Email and Password cannot be empty.');
      return;
    }

    if (!isValidEmail(email!)) {
      ShowSnakBar(context, 'Invalid email format.');
      return;
    }

    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

  bool isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}").hasMatch(email);
  }
}
