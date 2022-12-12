import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

import 'package:recycle/drawer.dart';
import 'package:recycle/aboutus/pages/profile1.dart';
import 'package:recycle/aboutus/pages/profile2.dart';
import 'package:recycle/aboutus/pages/profile3.dart';
import 'package:recycle/aboutus/pages/profile4.dart';
import 'package:recycle/aboutus/pages/profile5.dart';
import 'package:recycle/aboutus/pages/profile6.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
        backgroundColor: Color.fromARGB(255, 114, 196, 100),
        appBar: AppBar(
          title: const Text("Our Team"),
        ),
        drawer: const ExternalDrawer(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/1208307.jpg')),
              GlowText(
                'Muflih',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Color.fromARGB(255, 24, 100, 3),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Profile1Page()));
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
                      child: const GlowText('See Profile'))),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Color.fromARGB(255, 114, 196, 100),
                ),
              ),
              CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/1208307.jpg')),
              GlowText(
                'Alifia',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Color.fromARGB(255, 24, 100, 3),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Profile2Page()));
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
                      child: const GlowText('See Profile'))),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Color.fromARGB(255, 114, 196, 100),
                ),
              ),
              CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/1208307.jpg')),
              GlowText(
                'Edo',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Color.fromARGB(255, 24, 100, 3),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Profile3Page()));
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
                      child: const GlowText('See Profile'))),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Color.fromARGB(255, 114, 196, 100),
                ),
              ),
              CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/1208307.jpg')),
              GlowText(
                'Febi',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Color.fromARGB(255, 24, 100, 3),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Profile4Page()));
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
                      child: const GlowText('See Profile'))),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Color.fromARGB(255, 114, 196, 100),
                ),
              ),
              CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/1208307.jpg')),
              GlowText(
                'Gabing',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Color.fromARGB(255, 24, 100, 3),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Profile5Page()));
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
                      child: const GlowText('See Profile'))),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Color.fromARGB(255, 114, 196, 100),
                ),
              ),
              CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/1208307.jpg')),
              GlowText(
                'Sayyid',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Color.fromARGB(255, 24, 100, 3),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Profile6Page()));
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
                      child: const GlowText('See Profile'))),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Color.fromARGB(255, 114, 196, 100),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
