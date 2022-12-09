import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:recycle/Authentication/page/login_page.dart';
import 'package:recycle/Authentication/page/register_page.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notice Page"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "This application requires you to login first",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton.icon(
                    onPressed: () => {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const LoginPage()))),
                    },
                    icon: const Icon(Icons.login),
                    label: const Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton.icon(
                      onPressed: () => {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        const RegisterPage())))
                          },
                      icon: const Icon(Icons.add_box_rounded),
                      label: const Text("Register",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                        minimumSize: Size(140, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                      )),
                ),
              ],
            )
          ],
        ));
  }
}
