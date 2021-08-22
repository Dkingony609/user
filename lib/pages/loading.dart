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
            Image.network(
              'https://hng.tech/img/brand-logo.png',
              width: 170,
            ),
            SizedBox(height: 50),
            Text(
              'In Partnership with',
              style: TextStyle(color: Colors.black, fontSize: 17.0),
            ),
            SizedBox(height: 20),
            Image.network(
              'https://i.postimg.cc/4N5bkk8g/zuri.png',
              width: 120,
            ),
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
