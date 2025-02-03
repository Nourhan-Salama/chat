import 'package:chat_app2/Components/chat_buble.dart';
import 'package:chat_app2/Screens/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chatpage extends StatelessWidget {
static String id = 'Chat Page';
CollectionReference messages = FirebaseFirestore.instance.collection(kMessagesCollection);
 final TextEditingController _controller = TextEditingController();

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
     body:Column(
       children: [
         Expanded(
           child: ListView.builder(itemBuilder: (context,index){
            return  ChatBuble();
           }),
         ),
         Container(
           child: Padding(
             padding: const EdgeInsets.only(top: 10),
             child: TextField(
              controller: _controller,
              onSubmitted: (value) {
                messages.add({
                  "messages":value
                });
                _controller.clear();
              },
              
                 decoration: InputDecoration(
              hintText: "send message",
              suffix: Icon(
             Icons.send   
              ),
              iconColor: kPrimaryColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: kPrimaryColor
                )
              ),
                       ),    
             ),
           ),
         )
       ],
     ),
    );
    
  }
}