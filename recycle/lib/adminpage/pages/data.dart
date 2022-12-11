import 'package:flutter/material.dart';
import 'package:recycle/drawer.dart';
import 'package:recycle/adminpage/models/feedback.dart';
import 'package:recycle/adminpage/pages/adminpage.dart';

class MyDataPage extends StatefulWidget {
  const MyDataPage({super.key});

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  @override
  Widget build(BuildContext context) {
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
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdminPage()));
                },
                tooltip: 'Go Back',
                child: const Icon(Icons.home),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 138, 237, 142),
        appBar: AppBar(
            title: const Text('Data Feedback'),
            backgroundColor: Colors.green //appbar background color
            ),
        drawer: const ExternalDrawer(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: DataFeedback.datafeedbacks.map((datafeedback) {
                return Card(
                  child: ListTile(
                      leading: const Icon(
                        Icons.speaker_notes_rounded,
                        color: Color.fromARGB(255, 189, 246, 191),
                      ),
                      title: Text(
                          "${datafeedback.email}\n${datafeedback.description}"),
                      subtitle:
                          Text(datafeedback.date.toString().split(' ')[0]),
                      trailing: Text("♻️${datafeedback.type}♻️")),
                );
              }).toList(),
            ),
          ),
        ));
  }
}
