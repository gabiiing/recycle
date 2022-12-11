import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:recycle/Alfredo/pages/notice_page.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return AppBar(
      backgroundColor: Colors.green,
      elevation: 0.0,
      actions: <Widget>[
        IconButton(
          tooltip: 'Logout',
          hoverColor: Colors.lightGreen,
          icon: const Icon(Icons.logout),
          iconSize: 24.0,
          onPressed: () async {
            await request
                .logout(
                    "https://pbp-d01.up.railway.app/authentications/logout/")
                .then((value) {
              return showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 15,
                      child: ListView(
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                        ),
                        shrinkWrap: true,
                        children: [
                          const Center(
                            child: Text(
                              'Logout Success!',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            child: const Text(
                              'Close',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NoticePage(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  });
            });
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
