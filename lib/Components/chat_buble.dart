import 'package:chat_app2/Screens/constants.dart';
import 'package:flutter/material.dart';


class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(top: 10,bottom: 10,left: 16,right: 16),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: kPrimaryColor,
         borderRadius:BorderRadius.only(
         topLeft: Radius.circular(25),
         topRight: Radius.circular(25),
         bottomRight: Radius.circular(25)
         ) ,
        ),
        child: Text('I am nour',
        style: TextStyle(
          color: Colors.white,
        ),
        ),
       
      ),
    );
  }
}