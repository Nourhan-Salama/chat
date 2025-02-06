import 'package:chat_app2/Components/chat_buble.dart';
import 'package:chat_app2/Models/message_model.dart';
import 'package:chat_app2/Screens/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chatpage extends StatelessWidget {
static String id = 'Chat Page';
CollectionReference messages = FirebaseFirestore.instance.collection(kMessagesCollection);
 final TextEditingController _controller = TextEditingController();
 final controller = ScrollController();


  @override
  Widget build(BuildContext context) {
   var email= ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream:messages.orderBy('createdAt',descending: true).snapshots(),
      builder: (context , snapShot){
        if(snapShot.hasData){
          List <Message> messagesList =[];
          for(int i=0;i< snapShot.data!.docs.length;i++)
          {
             messagesList.add(Message.fromJson(snapShot.data!.docs[i].data() as Map<String, dynamic>));

          }
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
           child: ListView.builder(
            reverse: true,
            controller: controller,
            itemCount:messagesList.length,
            itemBuilder: (context,index){
            
            return  messagesList[index].id == email ? 
            ChatBuble(message: messagesList[index])
            : ChatBubleFriend(message: messagesList[index]);
           }),
         ),
         Container(
           child: Padding(
             padding: const EdgeInsets.only(top: 10,bottom: 10,right: 5,left: 5),
             child: TextField(
              controller: _controller,
              onSubmitted: (value) {
                messages.add({
                  "messages":value,
                  "createdAt":DateTime.now(),
                  'id':email
                });
                _controller.clear();
                controller.animateTo(
                  0,
                   duration:Duration(seconds: 1), 
                   curve: Curves.easeInOut);
              },
                 decoration: InputDecoration(
              hintText: "Send Message",
              suffix: Icon(
             Icons.send   
              ),
              iconColor: kPrimaryColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
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
        }else{
          return Text('Loding..');
        }
        
      }
      );
    
  }
}