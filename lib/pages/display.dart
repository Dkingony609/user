import 'package:flutter/material.dart';

class DisplayScreen extends StatefulWidget {
  String fullName;
  String userName;
  String email;
  String track;

  DisplayScreen(
      {required this.fullName,
      required this.userName,
      required this.email,
      required this.track});

  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            children: [
              Text(
                'Welcome! ${widget.fullName}',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 20),
              Text('Your details...'),
              SizedBox(height: 50),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(widget.fullName,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(widget.userName,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(widget.email,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(widget.track,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
