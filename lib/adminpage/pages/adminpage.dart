import 'package:flutter/material.dart';
import 'package:recycle/drawer.dart';
import 'package:provider/provider.dart';
import 'package:recycle/adminpage/pages/data.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final _formKey = GlobalKey<FormState>();

  String _email = "";
  String _name = "";
  String _description = "";
  String _type = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: const Text('Feedback Form'),
          backgroundColor: Colors.green //appbar background color
          ),
      drawer: const ExternalDrawer(),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Text(
                            'Admin Page',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Tell us what you think! We value your feedback.',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: [
                              Image.asset('assets/images/asset1.png'),
                            ],
                          ),
                          ListTile(
                            title: const Text(
                              '◽Feedback Admin◽',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            trailing:
                                const Icon(Icons.keyboard_arrow_right_sharp),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FeedbackPage(),
                                ),
                              );
                            },
                          ),
                          Padding(
                            // Input nama
                            // Menggunakan padding sebesar 8 pixels
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Enter app or event",
                                labelText: "Types of Feedback",
                                // Menambahkan circular border agar lebih rapi
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 3, color: Colors.green),
                                ),
                              ),
                              // Menambahkan behavior saat nama diketik
                              onChanged: (String? value) {
                                setState(() {
                                  _name = value!;
                                });
                              },
                              // Menambahkan behavior saat data disimpan
                              onSaved: (String? value) {
                                setState(() {
                                  _name = value!;
                                });
                              },
                              // Validator sebagai validasi form
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Type cannot be empty!';
                                }
                              },
                            ),
                          ),
                          Padding(
                            // Input email
                            // Menggunakan padding sebesar 8 pixels
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Enter your email address",
                                labelText: "E-mail",
                                // Menambahkan circular border agar lebih rapi
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 3, color: Colors.green),
                                ),
                              ),
                              // Menambahkan behavior saat nama diketik
                              onChanged: (String? value) {
                                setState(() {
                                  _email = value!;
                                });
                              },
                              // Menambahkan behavior saat data disimpan
                              onSaved: (String? value) {
                                setState(() {
                                  _email = value!;
                                });
                              },
                              // Validator sebagai validasi form
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email address cannot be empty!';
                                }
                              },
                            ),
                          ),
                          Padding(
                            // Input email
                            // Menggunakan padding sebesar 8 pixels
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Enter your feedback",
                                labelText: "Description",
                                // Menambahkan circular border agar lebih rapi
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 3, color: Colors.green),
                                ),
                              ),
                              // Menambahkan behavior saat nama diketik
                              onChanged: (String? value) {
                                setState(() {
                                  _description = value!;
                                });
                              },
                              // Menambahkan behavior saat data disimpan
                              onSaved: (String? value) {
                                setState(() {
                                  _description = value!;
                                });
                              },
                              // Validator sebagai validasi form
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Description cannot be empty!';
                                }
                              },
                            ),
                          ),
                          ElevatedButton(
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () async {
                                _formKey.currentState!.validate();
                                if (_formKey.currentState!.validate()) {
                                  String nama_admin = _name;
                                  await request.post(
                                      "https://pbp-d01.up.railway.app/adminpage/add-feedback/",
                                      {
                                        "nama_admin": nama_admin,
                                        "email_admin": _email,
                                        "deskripsi": _description,
                                      }).then(
                                    (value) {
                                      return showDialog(
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
                                                      'Successfully submitted ✅',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                    onError: (error) {
                                      return showDialog(
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
                                                      "Unable to submit feedback for some reason!",
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
                              })
                        ],
                      ),
                    ),
                  ])))),
    );
  }
}
