import 'package:flutter/material.dart';

// Screen displayed when matches have been found
class MatchesFound extends StatefulWidget {
  @override
  createState() => new _MatchesFoundState();
}

// State for when matches are found
class _MatchesFoundState extends State<MatchesFound> {
    @override 
    initState(){
        super.initState();
    }

    final matchUserAvatars = ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 24.0),
        itemBuilder: (BuildContext context, int index){
            //TODO: Fetch matches from API
            return MatchUserAvatar(text: '$index', backgroundColor: Colors.grey.shade500,);
        }
    );

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
                children: <Widget>[
                    Text('RECENT MATCHES',
                        style: TextStyle(
                            color:Colors.grey.shade500,
                            fontSize:18.0,
                        ),
                    ),
                    
                    Expanded(child: this.matchUserAvatars,), //User avatars

                    Expanded(
                        flex: 2,
                        child: Container(
                            margin: EdgeInsets.only(top:8.0),
                            width: 200.0,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.grey.shade600,Colors.grey.shade400],

                                ),
                            ),
                            
                            child: Center(
                                child: Text('Image will go here',style:TextStyle(color: Colors.white),),
                            )
                        ),
                    )
                ],
            ),
        );
    }

}

class MatchUserAvatar extends StatelessWidget {
    final String text;
    final Color backgroundColor;

    MatchUserAvatar({this.text,this.backgroundColor});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
            child: Text(this.text,
                style: TextStyle(color:Colors.white),
            ),//User's abbreviations if no picture available
            backgroundColor: this.backgroundColor,
            //TODO: Add background image property
            radius: 40.0,  
        )
    );
  }
}