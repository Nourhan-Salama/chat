import 'package:chat_app2/Components/chat_buble.dart';
import 'package:chat_app2/Screens/constants.dart';
import 'package:flutter/material.dart';

class Chatpage extends StatelessWidget {
static String id = 'Chat Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(kPrimaryImage,
            height: 50,),
            Text('Chat',
            style:TextStyle(
              color:Colors.white)  ,),
          ],
        ),
      ),
     body: ChatBuble(),
    );
    
  }
}