

import 'package:chat_app2/Screens/chatPage.dart';
import 'package:chat_app2/Screens/login.dart';
import 'package:chat_app2/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/register.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
 
  runApp(ChatApp());
}


class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Login.id: (context) => Login(),
        RegisterPage.id: (context) => RegisterPage(),
        Chatpage.id:(context)=>Chatpage()
      },
      initialRoute: Login.id,
    );
  }
}
