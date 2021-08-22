import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:user/pages/display.dart';

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
      onChanged: (value) => fullName = value,
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
        title: Text('HNG 8'),
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
              Text(
                'Welcome to the HNG [8] Internship!',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 50),
              _buildFullName(),
              _buildUserName(),
              _buildEmail(),
              _buildTrack(),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  } else {
                    _formKey.currentState!.save();
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DisplayScreen(
                        fullName: fullName,
                        userName: userName,
                        email: email,
                        track: track,
                      ),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  padding: EdgeInsets.all(20.0),
                ),
                child: Center(
                  child: Text(
                    'View Profile',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          launchHNGURL();
                        },
                        icon: Icon(
                          Icons.link,
                          size: 27,
                          color: Colors.blueAccent,
                        ),
                    ),
                    SizedBox(width: 10),
                    Image.network(
                      'https://i.postimg.cc/4N5bkk8g/zuri.png',
                      width: 120,
                    )
                    // SizedBox(width: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
