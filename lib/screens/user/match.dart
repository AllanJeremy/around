import 'package:flutter/material.dart';
import '../../styles/app_theme.dart';
import 'match/no_matches_found.dart';
import 'match/matches_found.dart';

// Stateful widget
class MatchPage extends StatefulWidget {
  static final Widget noMatchesFoundScreen = new NoMatchesFound();
  static final Widget matchesFoundScreen = new MatchesFound();

  @override
  _MatchPageState createState() => _MatchPageState();
}

// State
class _MatchPageState extends State<MatchPage> {
    bool autoMatchIsActive;
    bool hasMatches;
    Widget activePage;

    int activeBottomNavIndex;
    final bottomNav = <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.people,),
            title: Container()
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.mail,),
            title: Container()
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications,),
            title: Container()
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person,),
            title: Container()
        ),
    ];

    //Update the switch state
    void updateMatchingActive(bool matchingActive){
        setState((){
            this.autoMatchIsActive = !this.autoMatchIsActive;
        });
    }
  // Update the active page
  void _updateActivePage()
  {
      setState((){
          this.activePage = this.hasMatches ? MatchPage.matchesFoundScreen : MatchPage.noMatchesFoundScreen;
      });
  }

  void _updateBottomNav(int index){
      setState(() {
           activeBottomNavIndex = index;
           this.hasMatches = !this.hasMatches;
        });
  }

  //When something is selected from the actions
  void _onSelected(value) {
    print(value);
  }

  //Initial state
  @override
  void initState() {
    super.initState();
    activeBottomNavIndex = 0;
    this.hasMatches = false; //TODO: Make this check if there are actually any matches
    this._updateActivePage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                title: Text(
                "Singularity",
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,//TODO : Change to theme text color
                )        
                ),
                backgroundColor: AppTheme.mainAppColor,//TODO : Change to theme color
                actions: <Widget>[
                     PopupMenuButton(
                        onSelected: _onSelected,
                        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                            PopupMenuItem(
                                value: 'autoMatchToggle',
                                child: Text("Enable automatching"),
                            ),
                            PopupMenuItem(
                                value: 'navChat',
                                child: Text("Chats"),
                            ),
                            PopupMenuItem(
                                value: 'navCalls',
                                child: Text("Calls"),
                            ),
                            PopupMenuItem(
                                value: 'navSettings',
                                child: Text("Settings"),
                            ),
                        ])
                ],
            ),
            body: Column(
                children: <Widget>[
                    SizedBox(height: 16.0,),
                    Text('RECENT MATCHES',
                        style: TextStyle(
                            color:Colors.grey.shade500,
                            fontSize:18.0,
                        ),
                    ),
                    //Page contents
                    Expanded(
                        child: Container(
                            child: this.activePage,
                        )
                    ),

                    //Bottom
                    Container(
                        height: 72.0,
                        color: Colors.grey.shade200,
                        child: Center(
                            child: DecoratedBox(
                                decoration: BoxDecoration(
                                border: Border.all(color:Colors.black87, width:1.0)
                                ),
                                child: MaterialButton(
                                    padding: EdgeInsets.all(16.0),
                                    onPressed: (){},
                                    child: Text(
                                        'Find people now',
                                        style: TextStyle(
                                            fontSize: 16.0
                                        )
                                    ),
                            ) ,
                            )
                        )
                    ),
                    
                ]
            ),
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                iconSize: 36.0,
                currentIndex: activeBottomNavIndex,
                onTap: _updateBottomNav,
                fixedColor: Colors.black,
                items: bottomNav,
            ),
        )    
    );
  }
}

    