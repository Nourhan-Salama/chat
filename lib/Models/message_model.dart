import 'package:chat_app2/Screens/constants.dart';

class Message{
final String message;
final String id;
final int time;
Message(this.message,this.id,this.time);

  factory Message.fromJson(Map<String, dynamic> jsonData) {
    return Message(jsonData['messages'] ?? "",jsonData['id']??"",jsonData['time']??0);
  }
}