import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SideNavProject(),
    ),
  );
}

class SideNavProject extends StatefulWidget {
  SideNavProject({Key key}) : super(key: key);

  @override
  _SideNavProjectState createState() => _SideNavProjectState();
}

class _SideNavProjectState extends State<SideNavProject> {
  @override
  //set intial position by first nav item
  double _selectorLocation = 225;
  //function for button press of nav item to move the position of indicator
  void _selectorLocationAnimation(double newLocation) {
    _selectorLocation = newLocation;
  }

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Row(
        children: [
          //Created a stack so the indicator could move over sidenav
          Stack(
            children: [
              //container for sidenav
              Container(
                height: height,
                width: 75,
                color: Color(0xFF658429),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    //sidenav items
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            //move to first nav position
                            _selectorLocationAnimation(220);
                          });
                        },
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            'Green Plants',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            //move to second nav position
                            _selectorLocationAnimation(340);
                          });
                        },
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            'Indoor Plants',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            //move to third nav position
                            _selectorLocationAnimation(455);
                          });
                        },
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            'Shape Close',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 40),
                      child: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              //Used an animated position so the container could move with animation
              AnimatedPositioned(
                top: _selectorLocation,
                right: -25,
                duration: Duration(milliseconds: 300),
                //I created this indicator really quick you can create your own and make it the child
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(45 / 360),
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: height,
            width: 300,
          ),
        ],
      ),
    );
  }
}
