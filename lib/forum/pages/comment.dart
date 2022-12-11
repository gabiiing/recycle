import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:recycle/forum/functions/functions.dart';
import '../models/comment_model.dart';

class CommentPage extends StatefulWidget {
  final int id;
  const CommentPage({Key? key, required this.id}) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  List<String> commentText = [];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    List<String> commentText = [];
    final screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder(
        future: fetchComment(widget.id),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.2),
              child: const Center(child: CircularProgressIndicator()),
            );
          } else {
            if (!snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.2),
                child: const Text(
                  "There's no comment yet. Be the first to give a comment!",
                  style: TextStyle(color: Colors.green, fontSize: 20),
                ),
              );
            } else {
              commentText = [];
              for (int i = 1; i <= snapshot.data!.length; i++) {
                commentText.add("");
              }
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.green[400],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Form(
                        child: ListTile(
                          title: Text(
                            snapshot.data![index].fields.username,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing:
                              Text("Comment ID: ${snapshot.data![index].pk}"),
                          subtitle: DefaultTextStyle.merge(
                            style: const TextStyle(color: Colors.black),
                            child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Visibility(
                                            visible: snapshot.data![index]
                                                        .fields.parentPk ==
                                                    null
                                                ? false
                                                : true,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: snapshot
                                                              .data![index]
                                                              .fields
                                                              .parentPk ==
                                                          null
                                                      ? 0.0
                                                      : 10.0),
                                              child: Text(
                                                  "Replying to ID: ${snapshot.data![index].fields.parentPk}"),
                                            )),
                                        Text(snapshot
                                            .data![index].fields.commentText),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15.0, bottom: 12.0),
                                          child: SizedBox(
                                            height: 40,
                                            child: TextFormField(
                                              initialValue: commentText[index],
                                              decoration: const InputDecoration(
                                                hintText:
                                                    "Type here to reply to this comment",
                                                hintStyle:
                                                    TextStyle(fontSize: 12),
                                                border: OutlineInputBorder(),
                                              ),
                                              style:
                                                  const TextStyle(fontSize: 12),
                                              onChanged: (String? value) {
                                                commentText[index] = value!;
                                              },
                                              validator: (String? value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Comment must not be empty.';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.blue),
                                              ),
                                              onPressed: () {
                                                if (commentText[index]
                                                    .isNotEmpty) {
                                                  addComment(
                                                      request,
                                                      widget.id,
                                                      snapshot.data![index].pk,
                                                      commentText[index]).then((value) => setState(() {}));
                                                }
                                              },
                                              child: const Text(
                                                "Submit",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Visibility(
                                              visible: request
                                                      .jsonData["username"] ==
                                                  snapshot.data![index].fields
                                                      .username,
                                              child: TextButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.red),
                                                ),
                                                onPressed: () {
                                                  deleteComment(request,
                                                      snapshot.data![index].pk).then((value) => setState(() {}));
                                                },
                                                child: const Text(
                                                  'Delete',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ]),
                                )),
                          ),
                        ),
                      )));
            }
          }
        });
  }
}
