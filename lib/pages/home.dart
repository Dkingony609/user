import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  launchHNGURL() async {
    const url = 'https://hng.tech/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchZuriURL() async {
    const url = 'https://internship.zuri.team/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String fullName = '';
  String userName = '';
  String email = '';
  String phoneNumber = '';
  String track = '';

  Widget _buildFullName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Full Name',
      ),
      validator: (dynamic value) {
        if (value.isEmpty) {
          return 'Name is required!';
        }
        return null;
      },
      onSaved: (dynamic value) {
        setState(() {
          fullName = value;
        });
      },
    );
  }

  Widget _buildUserName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Slack Username',
      ),
      validator: (dynamic value) {
        if (value.isEmpty) {
          return 'Please pick a username!';
        }
        return null;
      },
      onSaved: (dynamic value) {
        userName = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
      ),
      validator: (dynamic value) {
        if (value.isEmpty) {
          return 'Invaild email address!';
        }
        return null;
      },
      onSaved: (dynamic value) {
        email = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: 'Phone Number',
      ),
      validator: (dynamic value) {
        if (value.isEmpty) {
          return 'Phone Number is required!';
        }
        return null;
      },
      onSaved: (dynamic value) {
        phoneNumber = value;
      },
    );
  }

  Widget _buildTrack() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: 'Track',
      ),
      validator: (dynamic value) {
        if (value.isEmpty) {
          return 'Please, signify a track';
        }
        return null;
      },
      onSaved: (dynamic value) {
        track = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Demo'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        margin: EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Welcome to the HNG Internship!',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 50),
              _buildFullName(),
              _buildUserName(),
              _buildEmail(),
              _buildPhoneNumber(),
              _buildTrack(),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  _formKey.currentState!.save();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  padding: EdgeInsets.all(20.0),
                ),
                child: Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        launchHNGURL();
                      },
                      child: Image.asset(
                        'hng.png',
                        height: 150,
                        width: 150,
                      )),
                  SizedBox(width: 50),
                  TextButton(
                    onPressed: () {
                      launchZuriURL();
                    },
                    child: Image.asset(
                      'zuri.png',
                      height: 150,
                      width: 150,
                    ),
                  )
                ],
              ),
              Text(fullName),
              Text(userName),
              Text(email),
              Text(phoneNumber),
              Text(track),
            ],
          ),
        ),
      ),
    );
  }
}
