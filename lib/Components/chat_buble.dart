import 'package:chat_app2/Screens/constants.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(18),
      height: 65,
      width: 150,
      decoration: BoxDecoration(
        color: kPrimaryColor,
       borderRadius:BorderRadius.only(
       topLeft: Radius.circular(25),
       topRight: Radius.circular(5),
       bottomRight: Radius.circular(5)
       ) ,
      ),
      child: Text('I am nour',
      style: TextStyle(
        color: Colors.white,
      ),
      ),
     
    );
  }
}