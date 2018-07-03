import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget{

    @override
    Widget build(BuildContext context){
        return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
                children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(32.0),
                        color: Colors.grey,
                        child: Center(
                            child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                minRadius: 96.0,
                                maxRadius: 256.0,
                                child:FloatingActionButton(
                                    backgroundColor: Colors.blue,//TODO : Change to app theme color
                                    onPressed: ()=>print('Edit picture'),//TODO: Callback for edit picture
                                    child: Icon(Icons.camera_alt,
                                        size:48.0
                                    ),
                                ),
                            ),
                        ),
                    ),

                ],
            ),
        );
    }
}