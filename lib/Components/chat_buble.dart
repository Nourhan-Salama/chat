import 'package:chat_app2/Models/message_model.dart';
import 'package:chat_app2/Screens/constants.dart';
import 'package:flutter/material.dart';


class ChatBuble extends StatelessWidget {
  final Message message;
  ChatBuble({super.key,
  required this.message
  });

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
        child: Text(message.message,
        style: TextStyle(
          color: Colors.white,
        ),
        ),
       
      ),
    );
  }
}
class ChatBubleFriend extends StatelessWidget {
  final Message message;
  ChatBubleFriend({super.key,
  required this.message
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(top: 10,bottom: 10,left: 16,right: 16),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 61, 114, 158),
         borderRadius:BorderRadius.only(
         topLeft: Radius.circular(25),
         topRight: Radius.circular(25),
         bottomLeft: Radius.circular(25)
         ) ,
        ),
        child: Text(message.message,
        style: TextStyle(
          color: Colors.white,
        ),
        ),
       
      ),
    );
  }
}