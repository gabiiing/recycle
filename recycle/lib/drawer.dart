import 'package:flutter/material.dart';
import 'package:recycle/Authentication/page/authentication.dart';
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
            title: const Text("Main"),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyHomePage(title: "Test")));
            },
          ),
          ListTile(
            title: const Text("Authentication"),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AuthenticationPage()));
            },
          ),
        ],
      ),
    );
  }
}
