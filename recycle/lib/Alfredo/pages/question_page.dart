import 'package:flutter/material.dart';
import 'package:recycle/Alfredo/pages/form_question.dart';
import 'package:recycle/Alfredo/pages/home_page.dart';
import 'package:recycle/Alfredo/utils/fetch_question.dart';
import 'package:recycle/Alfredo/widgets/customAppBar.dart';
import 'package:recycle/Alfredo/widgets/question_card.dart';
import 'package:recycle/drawer.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const ExternalDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  textStyle: const TextStyle()),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: Icon(
                  Icons.home,
                  size: 20,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FormQuestion()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  textStyle: const TextStyle()),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: Icon(
                  Icons.add,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      // ElevatedButton(
      //   onPressed: () {
      //     Navigator.pushReplacement(context,
      //         MaterialPageRoute(builder: (context) => const FormQuestion()));
      //   },
      //   style: ElevatedButton.styleFrom(
      //       backgroundColor: Colors.green,
      //       foregroundColor: Colors.white,
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(30.0),
      //       ),
      //       textStyle: const TextStyle()),
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      //     child: Icon(
      //       Icons.add,
      //       size: 20,
      //     ),
      //   ),
      // ),
      body: FutureBuilder(
        future: fetchQuestion(),
        builder: ((context, snapshot) {
          if (snapshot.data != null) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        // Text("Tes"),
                        QuestionCard(
                          date: snapshot.data?[index].fields?.date,
                          questionTitle: snapshot.data?[index].fields?.title,
                          questionDescription:
                              snapshot.data?[index].fields?.description,
                          pk: snapshot.data?[index].pk,
                          userId: snapshot.data?[index].fields?.user,
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text(
                  "No Question Found",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
