import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:recycle/forum/functions/functions.dart';

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
  List<String> commentText = [];

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
    final request = context.watch<CookieRequest>();
    final screenWidth=MediaQuery.of(context).size.width;
    final screenHeight=MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(title: Text("${title}")),
        body: SingleChildScrollView(
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
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          ),
                                      child: Form(
                                        child: ListTile(
                                          title: Text(
                                            snapshot
                                                .data![index].fields.username,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          trailing: Text(
                                              "Comment ID: ${snapshot.data![index].pk}"),
                                          subtitle: DefaultTextStyle.merge(
                                            style: TextStyle(color:Colors.black),
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Visibility(
                                                            visible: snapshot
                                                                        .data![
                                                                            index]
                                                                        .fields
                                                                        .parentPk ==
                                                                    null
                                                                ? false
                                                                : true,
                                                            child: Padding(
                                                              padding: EdgeInsets.only(bottom:snapshot
                                                                        .data![
                                                                            index]
                                                                        .fields
                                                                        .parentPk ==
                                                                    null
                                                                ? 0.0
                                                                : 10.0),
                                                              child: Text(
                                                                  "Replying to ID: ${snapshot.data![index].fields.parentPk}"),
                                                            )),
                                                        Text(snapshot.data![index]
                                                            .fields.commentText),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 15.0, bottom:12.0),
                                                          child: SizedBox(
                                                            height: 40,
                                                             child:TextFormField(
                                                            decoration:
                                                                const InputDecoration(
                                                              hintText:
                                                                  "Type here to reply to this comment",
                                                              hintStyle: TextStyle(
                                                                fontSize: 12
                                                              ),
                                                              border:
                                                                  OutlineInputBorder(),
                                                            ),
                                                            style: TextStyle(
                                                                fontSize: 12
                                                              ),
                                                            onChanged:
                                                                (String? value) {
                                                              setState(() {
                                                                commentText[index] =
                                                                    value!;
                                                              });
                                                            },
                                                            onSaved:
                                                                (String? value) {
                                                              setState(() {
                                                                commentText[index] =
                                                                    value!;
                                                              });
                                                            },
                                                            validator:
                                                                (String? value) {
                                                              if (value == null ||
                                                                  value.isEmpty) {
                                                                return 'Comment must not be empty.';
                                                              }
                                                              return null;
                                                            },
                                                          ),
                                                        ),),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                         children:[ 
                                                        TextButton(
                                                          style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(Colors
                                                                        .blue),
                                                          ),
                                                          onPressed: () {
                                                            if (commentText[index]
                                                                .isNotEmpty) {
                                                              addComment(
                                                                  request,
                                                                  widget.id,
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .pk,
                                                                  commentText[
                                                                      index]);
                                                              setState(() {});
                                                            }
                                                          },
                                                          child: const Text(
                                                            "Submit",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.white),
                                                          ),
                                                        ),
                                                        Visibility(
                                                          visible: request.jsonData["username"]==snapshot.data![index].fields.username,
                                                          child: TextButton(
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all(Colors
                                                                          .red),
                                                            ),
                                                            onPressed: () {
                                                              deleteComment(
                                                                  request,
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .pk);
                                                              setState(() {});
                                                            },
                                                            child: const Text(
                                                              'Delete',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )]),)),
                                          ),
                                        ),
                                      )));
                            }
                          }
                        })
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
