import 'package:flutter/material.dart';
import 'package:recycle/Alfredo/pages/question_page.dart';
import 'package:recycle/Alfredo/utils/delete_question.dart';
import 'package:recycle/Authentication/page/login_page.dart';

class QuestionCard extends StatelessWidget {
  final DateTime? date;
  final String? questionTitle;
  final String? questionDescription;
  final int? pk;
  final int? userId;

  const QuestionCard({
    super.key,
    required this.date,
    required this.questionTitle,
    required this.questionDescription,
    required this.pk,
    required this.userId,
  });
  @override
  Widget build(BuildContext context) {
    print(userData!['idUser']);
    print(pk);
    print(userData!['idUser'] == pk);
    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.only(
          bottom: 20,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 25, left: 30),
                    child: Text(
                      date.toString().substring(0, 16),
                      style: const TextStyle(fontSize: 24),
                    )),
                userData!['idUser'] == userId
                    ? Padding(
                        padding: const EdgeInsets.only(top: 23, right: 30),
                        child: IconButton(
                          onPressed: () async {
                            await deleteQuestion(pk!).then(
                                (value) => {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const QuestionPage(),
                                        ),
                                      )
                                    }, onError: (e) {
                              print(e);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
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
                                              "Error, tidak bisa delete",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextButton(
                                            child: const Text(
                                              "Close",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      ),
                                    );
                                  });
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              textStyle: const TextStyle()),
                          icon: const Icon(Icons.delete),
                        ),
                      )
                    : const Text(""),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                questionTitle!,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 10),
              child: Text(
                questionDescription!,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
