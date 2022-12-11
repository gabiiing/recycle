import 'package:flutter/material.dart';
import 'package:recycle/Alfredo/pages/home_page.dart';
import 'package:recycle/adminpage/pages/adminpage.dart';
import 'package:recycle/Authentication/page/login_page.dart';
import 'package:recycle/main.dart';
import 'package:recycle/drawer.dart';

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
            title: const Text("Admin Page"),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const AdminPage()));
            },
          ),
        ],
      ),
    );
  }
}
