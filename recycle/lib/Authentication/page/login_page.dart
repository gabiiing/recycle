import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:recycle/Alfredo/pages/home_page.dart';
import 'package:recycle/Alfredo/pages/notice_page.dart';
import 'package:recycle/Authentication/page/register_page.dart';

Map<String, dynamic>? userData = {
  "status": false,
  "username": "",
  "idUser": -1,
};

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  bool _isObscure = true;
  String username = "";
  String password1 = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Container();
  }
}
