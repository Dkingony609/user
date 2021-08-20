import 'package:flutter/material.dart';

import 'home.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Padding(
        padding: const EdgeInsets.all(80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Image.asset('hng.png'),
            SizedBox(height: 50),
            Text(
              'In Partnership with',
              style: TextStyle(color: Colors.black, fontSize: 17.0),
            ),
            SizedBox(height: 20),
            Image.asset('zuri.png'),
            SizedBox(height: 50),
             OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 20,
                    ),
                  ),
                ),
            ),
          ],
        ),
      ))),
    );
  }
}
