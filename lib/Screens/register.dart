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
 

 RegisterPage({key}) ;
 

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
   bool isLoading = false;
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
             height: 100,),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                Text('Register',
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
              onChanged: (data) {
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
              onTap: () async {
             if (formKey.currentState!.validate()) {
            setState(() => isLoading = true);
        try {
      await userRegister();
      // ShowSnakBar(context,'Success');
      Navigator.pushNamed(context, 'Chat Page');
        } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
             ShowSnakBar(context,'Weak Password');
      } else if (e.code == "email-already-in-use") {
             ShowSnakBar(context,'email is already in use');
      } 
      // else {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //         SnackBar(content: Text('Error: ${e.message}')),
      //   );
      // }
         }
         catch(ex){
       ShowSnakBar(context, 'there was an error');
         }
       
       setState(() => isLoading = false);
      }
           },
           
                text: 'Register',
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Allready have an account?',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Text('  Login.',
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



  Future<void> userRegister() async {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}