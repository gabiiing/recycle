import 'package:flutter/material.dart';
import 'package:recycle/Alfredo/pages/notice_page.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded),
              iconSize: 25,
              onPressed: () => {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NoticePage())),
              },
            ),
            title: Text("Register Page", style: TextStyle(fontSize: 20))),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Please click the button below to be redirected to the registration page",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton.icon(
                      onPressed: () {
                        Uri registerUrl = Uri.parse(
                            "https://pbp-d01.up.railway.app/authentications/register/");
                        launchUrl(registerUrl);
                      },
                      icon: const Icon(Icons.ads_click_rounded),
                      label: const Text("Register",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                        minimumSize: Size(150, 50),
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
