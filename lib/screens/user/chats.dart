import 'package:flutter/material.dart';

import 'package:around/utils/chat_handler.dart';
import 'package:around/styles/app_theme.dart';
class ChatList extends StatefulWidget{
    @override
    createState() => _ChatListState();
}

class _ChatListState extends State<ChatList>{
    bool chatsFound;// * True if any chats were found
    List chats;

    final Widget widgetNoChatsFound = Center(
        child: Column(
            children: <Widget>[
                Text('No Chats found',
                    style:TextStyle(fontSize:18.0, color: Colors.grey.shade500),
                ),
                SizedBox(height:16.0),
                RaisedButton(
                    child: Text('New Chat'),
                    onPressed: ()=>print('Start new Chat'), //TODO: Navigate to create chat screen
                    color: AppTheme.mainAppColor,
                ),
                SizedBox(height:16.0),
            ]
        ),
    );

    Widget widgetChatList = Container(
        //TODO: Add chat list
    );

    void _updateChatsFoundState()
    {
        setState((){
            //Get chats
            this.chats = Chat.getChats();
            this.chatsFound = this.chats.length>0;
        });
    }

    @override
    initState(){
        super.initState();

        //Get chats
        this.chats = Chat.getChats();
        this.chatsFound = this.chats.length>0;
    }
    
    @override
    Widget build(BuildContext context){
        return Container(
            padding: EdgeInsets.all(16.0),
            child: this.chatsFound ? this.widgetChatList : this.widgetNoChatsFound,
        );
    }
}