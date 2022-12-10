import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:recycle/Alfredo/pages/home_page.dart';
import 'package:recycle/Alfredo/pages/question_page.dart';

class FormQuestion extends StatefulWidget {
  const FormQuestion({super.key});

  @override
  State<FormQuestion> createState() => _FormQuestionState();
}

class _FormQuestionState extends State<FormQuestion> {
  final _questionFormKey = GlobalKey<FormState>();

  String title = "";
  String description = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              heroTag: "Go Back Button",
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              tooltip: 'Go Back',
              child: const Icon(Icons.home),
            ),
            FloatingActionButton(
              heroTag: "View Question Button",
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuestionPage()));
              },
              tooltip: 'View Question',
              child: const Icon(Icons.question_answer),
            ),
          ],
        ),
      ),
      body: Form(
        key: _questionFormKey,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Ask Question Here!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Please fill the form below to ask a question",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
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
                          hintText: "Question Title",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Title must not be empty!";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            title = value;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            title = value!;
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
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Question Description",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Description must not be empty!";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            description = value;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            description = value!;
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
                            "Add Question",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onTap: () async {
                          if (_questionFormKey.currentState!.validate()) {
                            await request.post(
                                "https://pbp-d01.up.railway.app/recycle/create-question/",
                                {
                                  "title": title,
                                  "description": description,
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
                                                'Berhasil menambahkan pertanyaan!',
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
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              onError: (error) {
                                print(error);
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
                                                "Tidak dapat bertanya karena suatu hal!",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
