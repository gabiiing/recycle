import 'package:flutter/material.dart';
import 'package:recycle/main.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:recycle/drawer.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final _formKey = GlobalKey<_AuthenticationPageState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Authentication"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: TextFormField(),
              ),
            )
          ],
        ),
      ),
      drawer: const ExternalDrawer(),
    );
  }
}
