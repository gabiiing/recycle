import 'package:flutter/material.dart';
import 'package:recycle/forum/functions/functions.dart';
import 'package:recycle/forum/pages/comment.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class Forum extends StatefulWidget {
  final int id;
  const Forum({Key? key, required this.id}) : super(key: key);

  @override
  State<Forum> createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  String title = "Loading event info...";
  String username = "loading...";
  String startDate = "loading...";
  String finishDate = "loading...";
  String description = "loading...";
  final _formKey = GlobalKey<FormState>();
  String commentText = "";
  final TextEditingController _controller = TextEditingController();

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
    _controller.addListener(() {
      commentText = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    _controller.text = "";

    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Container(
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
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: username),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              const TextSpan(
                                  text: 'Start time: ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: startDate),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              const TextSpan(
                                  text: 'End time: ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: finishDate),
                            ],
                          ),
                        ),
                        const Text("Description:",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(description),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 15.0, bottom: 12.0),
                          child: SizedBox(
                            height: 40,
                            child: TextFormField(
                              controller: _controller,
                              decoration: const InputDecoration(
                                hintText: "Type here to add a new comment",
                                hintStyle: TextStyle(fontSize: 12),
                                border: OutlineInputBorder(),
                              ),
                              style: const TextStyle(fontSize: 12),
                              onChanged: (String? value) {
                                commentText = value!;
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Comment must not be empty.';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              addComment(request, widget.id, 0, commentText)
                                  .then((value) => setState(() {}));
                            }
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        CommentPage(id: widget.id),
                      ],
                    ),
                  ),
                ],
              ),
            ))));
  }
}
