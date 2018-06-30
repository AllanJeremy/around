import 'package:flutter/material.dart';

// Screen displayed when no matches have been found
class NoMatchesFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            children: <Widget>[
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 32.0),
                    child: Text('You have not yet matched with anyone. Your most recent matches will appear here',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey.shade600
                        ),
                    ),
                ),
                Expanded(
                    child: Icon(Icons.person, size: 48.0),
                ),
            ],
        ),
    );
  }
}