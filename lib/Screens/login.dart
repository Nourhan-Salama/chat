

import 'package:chat_app2/Components/custom_button.dart';
import 'package:chat_app2/Components/custom_text_field.dart';
import 'package:chat_app2/Screens/constants.dart';
import 'package:chat_app2/Screens/register.dart';
import 'package:chat_app2/helper/show-snack-bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class Login extends StatefulWidget {
  const Login({super.key});
  static String id = 'Login Page';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  bool isLoading =false; 
   String? email;
  String? password;
  GlobalKey <FormState> formKey = GlobalKey();
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
              SizedBox(height: 75,),
             Image.asset('assets/images/scholar.png',
             height: 100,
             ),
             
             Row(
               mainAxisAlignment:MainAxisAlignment.center,
               children: [
               
                 Text('Scholar Chat',
                 style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 32,
                  color: Colors.white,
                 ),
                 ),
               ],
             ),
             SizedBox(height: 60,),
           
             Row(
              children: [
                Text('Login',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
                ),
                
              ],
             ),
             SizedBox(
              height: 20,
             ),
            CustomTextField(
              onChanged: (data){
                email = data;
              },
              hintText: 'Email',
            ),
            SizedBox(
                height: 15,
              ),
            CustomTextField(
              onChanged: (data){
                password = data;
              },
              hintText: 'Password',
              ),
              SizedBox(
                height: 20,
              ),
                 CustomButton(
                  text: 'Login',

              onTap: () async {
             if (formKey.currentState!.validate()) {
            setState(() => isLoading = true);
            try {
              await userLogin();
              // ShowSnakBar(context,'Success');
              Navigator.pushNamed(context, 'Chat Page');
                } on FirebaseAuthException catch (e) {
              if (e.code == "wrong-password") {
                    ShowSnakBar(context,'Wrong Password');
              } else if (e.code == "user-not-found") {
                    ShowSnakBar(context,'user not found');
              } 
                } catch(ex){
                ShowSnakBar(context, 'there was an error');
                  }
       
                  setState(() => isLoading = false);
                  }
           }, 
           ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context,RegisterPage.id) ;
                              },
                    child: Text('  Sign Up.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
    Future<void> userLogin() async {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

}