import 'dart:math';

class Chat{
  //TODO: Add chat attributes here
  int id;
  String chatName;

  Chat()
  {
    this.id = Random().nextInt(10000000);
    this.chatName = 'Chat name';

  }
  // TODO: Check the database for chats for the current user
  static List getChats(){
    return [
      
    ];
  }
}