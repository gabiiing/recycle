import 'package:flutter/material.dart';
import 'package:recycle/drawer.dart';
import 'package:recycle/adminpage/utils/fetch.dart';
import 'package:recycle/adminpage/pages/adminpage.dart';
import 'package:recycle/adminpage/models/feedbackmodel.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<StatefulWidget> createState() => _FeedbackPage();
}

class _FeedbackPage extends State<FeedbackPage> {
  late FeedbackMethod data;
  late Future<List<Fdback>> _feedbackList;
  String nama = "";
  String type = "";
  @override
  void initState() {
    super.initState();
    setState(() {
      data = FeedbackMethod();
      _feedbackList = data.getAllFeedback();
    });
  }

  Widget buildTextButton(int index, int id) {
    return const Text("");
  }

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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const AdminPage()));
              },
              tooltip: 'Go Back',
              child: const Icon(Icons.home),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 245, 255, 246),
      appBar: AppBar(
        title: const Text("Feedback"),
      ),
      drawer: const ExternalDrawer(),
      body: FutureBuilder<List<Fdback>>(
        future: _feedbackList,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                type = item.fields.namaAdmin == "app"
                    ? "App Feedback"
                    : "Event Feedback";
                nama = item.fields.namaAdmin;
                return ListTile(
                  leading: const Icon(
                    Icons.speaker_notes_rounded,
                    color: Color.fromARGB(255, 34, 132, 38),
                  ),
                  title: Text(item.fields.emailAdmin),
                  subtitle: Text(item.fields.deskripsi),
                  trailing: Text("♻️ $type ♻️"),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
