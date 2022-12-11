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
  "isSuperuser": false,
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

    return Scaffold(
      body: Form(
        key: _loginFormKey,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Hello Again!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    )),
                const SizedBox(height: 10),
                const Text(
                  "Welcome back, you've been missed!",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Username",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your username";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            username = value;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            username = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            password1 = value;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            password1 = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12)),
                    child: GestureDetector(
                        child: const Center(
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onTap: () async {
                          if (_loginFormKey.currentState!.validate()) {
                            await request.login(
                                "https://pbp-d01.up.railway.app/authentications/login/process-login/",
                                {
                                  'username': username,
                                  'password': password1,
                                }).then(
                              (value) {
                                print(value);
                                showDialog(
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
                                          Center(
                                            child: Text(
                                              value['status']
                                                  ? 'Berhasil Login!'
                                                  : 'Username atau Password salah!',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextButton(
                                            child: Text(
                                              value['status']
                                                  ? 'Homepage'
                                                  : 'Close',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            onPressed: () {
                                              if (value['status']) {
                                                userData?['username'] =
                                                    value['username'];
                                                userData?['status'] =
                                                    value['status'];
                                                userData?['idUser'] =
                                                    value['idUser'];
                                                userData?['isSuperuser'] =
                                                    value['isSuperuser'];
                                                Navigator.pop(context);
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomePage(),
                                                  ),
                                                );
                                              } else {
                                                Navigator.pop(context);
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              onError: (error) {
                                print(error);
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                                "Tidak dapat login karena suatu hal!",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextButton(
                                              child: const Text(
                                                "Close",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            )
                                          ],
                                        ),
                                      );
                                    });
                              },
                            );
                          }
                        }),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Not a member? ",
                      style: TextStyle(fontSize: 18),
                    ),
                    GestureDetector(
                        child: const Text(
                          "Register Now",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () => {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage()))
                            })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SizedBox(
          width: double.maxFinite,
          child: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ))),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const NoticePage()));
            },
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Back',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),

      // SafeArea(
      //     child: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       const Text("Hello Again!",
      //           style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //             fontSize: 36,
      //           )),
      //       const SizedBox(height: 10),
      //       const Text(
      //         "Welcome back, you've been missed!",
      //         style: TextStyle(fontSize: 20),
      //       ),
      //       const SizedBox(height: 20),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 25.0),
      //         child: Container(
      //           decoration: BoxDecoration(
      //             color: Colors.grey[200],
      //             border: Border.all(color: Colors.white),
      //             borderRadius: BorderRadius.circular(12),
      //           ),
      //           child: Padding(
      //             padding: const EdgeInsets.only(left: 20.0),
      //             child: TextFormField(
      //               decoration: const InputDecoration(
      //                 border: InputBorder.none,
      //                 hintText: "Username",
      //               ),
      //               onChanged: (String? value) {
      //                 setState(() {
      //                   username = value!;
      //                 });
      //               },
      //               // Menambahkan behavior saat data disimpan
      //               onSaved: (String? value) {
      //                 setState(() {
      //                   username = value!;
      //                 });
      //               },
      //               validator: (String? value) {
      //                 if (value == null || value.isEmpty) {
      //                   return 'Username tidak boleh kosong!';
      //                 }
      //                 return null;
      //               },
      //             ),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(height: 10),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 25.0),
      //         child: Container(
      //           decoration: BoxDecoration(
      //             color: Colors.grey[200],
      //             border: Border.all(color: Colors.white),
      //             borderRadius: BorderRadius.circular(12),
      //           ),
      //           child: Padding(
      //             padding: const EdgeInsets.only(left: 20.0),
      //             child: TextFormField(
      //               obscureText: _isObscure,
      //               decoration: InputDecoration(
      //                 border: InputBorder.none,
      //                 hintText: "Password",
      //                 suffixIcon: IconButton(
      //                   icon: Icon(_isObscure
      //                       ? Icons.visibility
      //                       : Icons.visibility_off),
      //                   onPressed: () {
      //                     setState(() {
      //                       _isObscure = !_isObscure;
      //                     });
      //                   },
      //                 ),
      //               ),
      //               onChanged: (String? value) {
      //                 setState(() {
      //                   password1 = value!;
      //                 });
      //               },
      //               // Menambahkan behavior saat data disimpan
      //               onSaved: (String? value) {
      //                 setState(() {
      //                   password1 = value!;
      //                 });
      //               },
      //               validator: (String? value) {
      //                 if (value == null || value.isEmpty) {
      //                   return 'Password tidak boleh kosong!';
      //                 }
      //                 return null;
      //               },
      //             ),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(height: 10),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 25.0),
      //         child: Container(
      //           padding: const EdgeInsets.all(20.0),
      //           decoration: BoxDecoration(
      //               color: Colors.green,
      //               borderRadius: BorderRadius.circular(12)),
      //           child: const Center(
      //               child: Text(
      //             "Sign in",
      //             style: TextStyle(
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 20,
      //                 color: Colors.white),
      //           )),
      //         ),
      //       ),
      //       const SizedBox(height: 10),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           const Text("Not a member? "),
      //           GestureDetector(
      //               child: const Text(
      //                 "Register Now",
      //                 style: TextStyle(
      //                   color: Colors.blue,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //               onTap: () => {
      //                     Navigator.pushReplacement(
      //                         context,
      //                         MaterialPageRoute(
      //                             builder: (context) => const RegisterPage()))
      //                   })
      //         ],
      //       )
      //     ],
      //   ),
      // )),
    );
  }
}
