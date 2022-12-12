import 'package:flutter/material.dart';
import 'package:recycle/Alfredo/pages/home_page.dart';
import 'package:recycle/adminpage/pages/adminpage.dart';
import 'package:recycle/Authentication/page/login_page.dart';
import 'package:recycle/main.dart';
import 'package:recycle/drawer.dart';
import 'package:recycle/aboutus/pages/about_us.dart';
import 'event/page/event_your.dart';
import 'event/page/event_form.dart';
import 'event/page/event_dashboard.dart';


class ExternalDrawer extends StatefulWidget {
  const ExternalDrawer({super.key});

  @override
  State<StatefulWidget> createState() => _ExternalDrawer();
}

class _ExternalDrawer extends State<ExternalDrawer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: const Text("Home Page"),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          ListTile(
            title: const Text("Event Page"),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const EventForm()));
            },
          ),
          ListTile(
            title: const Text("Meet Our Team"),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const AboutUsPage()));
            },
          ), 
          ListTile(
            title: const Text("Meet Our Team"),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EventDashboard()));
            },

          ),        
          if (userData!['isSuperuser'])
            ListTile(
                title: const Text("Admin Page"),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdminPage()));
                })
        ],
      ),
    );
  }
}
