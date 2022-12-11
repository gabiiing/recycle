import 'package:flutter/material.dart';
import 'package:recycle/drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:recycle/adminpage/models/feedback.dart';
import 'package:recycle/adminpage/pages/data.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final _formKey = GlobalKey<FormState>();

  String _email = "";
  String _description = "";
  String? _type;
  DateTime? _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Feedback Form'),
          backgroundColor: Colors.green //appbar background color
          ),
      drawer: const ExternalDrawer(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                'Admin Page',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Image.asset('assests/images/asset1.png'),
                ],
              ),
              ListTile(
                title: const Text(
                  'Feedback Admin',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_sharp),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyDataPage(),
                    ),
                  );
                },
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
                      borderSide: BorderSide(width: 3, color: Colors.green),
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
                      borderSide: BorderSide(width: 3, color: Colors.green),
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
              Padding(
                // Input type
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  value: _type,
                  hint: const Text("Feedback Type"),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                      value: 'App Feedback',
                      child: Text('App Feedback'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Event Feedback',
                      child: Text('Event Feedback'),
                    ),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      _type = value ?? "";
                    });
                  },
                ),
              ),
              Padding(
                // Input Date
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.green,
                    ),
                    const SizedBox(width: 4.0),
                    TextButton(
                      onPressed: (() {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2999),
                        ).then((value) {
                          setState(() {
                            _date = value;
                          });
                        });
                      }),
                      child: Text(
                        _date.toString().split(' ')[0],
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.green,
                          // color: Colors.black87,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        DataFeedback.addDataFeedback(
                          email: _email,
                          description: _description,
                          type: _type,
                          date: _date,
                        );
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 15,
                              child: ListView(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 16.0,
                                ),
                                shrinkWrap: true,
                                children: [
                                  Center(
                                    child: Text(
                                      "Successfully submitted ♻️$_type♻️",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "Back",
                                        style: TextStyle(color: Colors.green),
                                      ))
                                ],
                              ),
                            );
                          },
                        );
                        _formKey.currentState!.reset();
                      }
                    },
                    style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(12.0)),
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    )),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
