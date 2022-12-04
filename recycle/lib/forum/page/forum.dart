import 'package:flutter/material.dart';
import 'package:recycle/forum/model/event_model.dart';
import 'package:recycle/forum/function/event_fetch.dart';
import 'package:recycle/forum/function/comment_fetch.dart';

class Forum extends StatefulWidget {
  final int id;
  const Forum({Key? key, required this.id}) : super(key: key);

  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  String title = "Loading event info...";
  String username = "loading...";
  String startDate = "loading...";
  String finishDate = "loading...";
  String description = "loading...";
  List<GlobalKey<FormState>> formKey = [];
  String commentText = "";

  @override
  void initState() {
    super.initState();
    fetchEvent(widget.id).then((value) {
      setState(() {
        title = value.title;
        username = value.username;
        startDate = value.startDate.toString();
        startDate = startDate.substring(0, startDate.length - 4);
        finishDate = value.finishDate.toString();
        finishDate = finishDate.substring(0, finishDate.length - 4);
        description = value.description;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${title}")),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                              text: 'Created by: ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: username),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                              text: 'Start time: ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: startDate),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                              text: 'End time: ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: finishDate),
                        ],
                      ),
                    ),
                    const Text("Description:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(description),
                    FutureBuilder(
                        future: fetchComment(widget.id),
                        builder: (context, AsyncSnapshot snapshot) {
                          formKey = [];
                          if (snapshot.data == null) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            if (!snapshot.hasData) {
                              return Column(
                                children: const [
                                  Text(
                                    "There's no comment yet. Be the first to give a comment!",
                                    style: TextStyle(
                                        color: Color(0xff59A5D8), fontSize: 20),
                                  ),
                                ],
                              );
                            } else {
                              for (int i = 1; i <= snapshot.data!.length; i++) {
                                formKey.add(GlobalKey<FormState>());
                              }
                              return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (_, index) => Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 12),
                                        padding: const EdgeInsets.all(20.0),
                                        decoration: const BoxDecoration(
                                            color: Colors.blue),
                                        child: ListTile(
                                          title: Text(
                                            snapshot
                                                .data![index].fields.username,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          trailing: Text(
                                              "Comment ID: ${snapshot.data![index].pk}"),
                                          subtitle: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.stretch,
                                                    children: [
                                                      Visibility(
                                                        visible: snapshot.data![index].fields.parentPk == null ? false : true,
                                                        child: Text("Replying to ID: ${snapshot.data![index].fields.parentPk}")
                                                      ),
                                                      Text(snapshot.data![index].fields.commentText),
                                                      TextFormField(
                                                        decoration:
                                                            const InputDecoration(
                                                          hintText:
                                                              "Type here to reply to this comment",
                                                          border:
                                                              OutlineInputBorder(),
                                                        ),
                                                        onChanged: (String? value) {
                                                          setState(() {
                                                            if (value != null) {
                                                              commentText = value;
                                                            }
                                                          });
                                                        },
                                                      ),
                                                      TextButton(
                                                        style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty.all(Colors.green),
                                                        ),
                                                        onPressed: () {},
                                                        child: const Text(
                                                          "Submit",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      )
                                                    ],
                                                  ))),
                                        ),
                                      ));
                            }
                          }
                        })
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
