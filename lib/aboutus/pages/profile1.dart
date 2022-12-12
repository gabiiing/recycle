import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_glow/flutter_glow.dart';

import 'package:recycle/drawer.dart';
import 'package:recycle/aboutus/pages/about_us.dart';

class Profile1Page extends StatefulWidget {
  const Profile1Page({super.key});

  @override
  State<Profile1Page> createState() => _Profile1PageState();
}

class _Profile1PageState extends State<Profile1Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffffd460),
        appBar: AppBar(
          title: const Text("Profile Page"),
        ),
        drawer: const ExternalDrawer(),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.greenAccent[400],
                radius: 100,
                child: GlowText(
                  'Re.Cycle',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                'Muflih Naufal Maxi',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              GlowText(
                textAlign: TextAlign.center,
                'Re.Cycle Developer',
                style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    letterSpacing: 2.5,
                    color: Color.fromARGB(255, 31, 181, 25),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Color.fromARGB(255, 51, 58, 52),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Color.fromARGB(255, 51, 58, 52),
                  ),
                  title: Text(
                    textAlign: TextAlign.center,
                    '(+62) 81380163649',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      color: Color.fromARGB(255, 51, 58, 52),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Color.fromARGB(255, 51, 58, 52),
                  ),
                  title: Text(
                    textAlign: TextAlign.center,
                    'muflihmaxi@gmail.com',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      color: Color.fromARGB(255, 51, 58, 52),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.instagram,
                    color: Color.fromARGB(255, 51, 58, 52),
                  ),
                  title: Text(
                    textAlign: TextAlign.center,
                    'muflihmaxi',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      color: Color.fromARGB(255, 51, 58, 52),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Color.fromARGB(255, 51, 58, 52),
                ),
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AboutUsPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 93, 202, 9),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        side: const BorderSide(
                          width: 3.0,
                          color: Color.fromARGB(255, 1, 45, 2),
                        ),
                      ),
                      child: const GlowText('Previous Page'))),
            ],
          ),
        ),
      ),
    );
  }
}
