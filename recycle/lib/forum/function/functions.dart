import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:recycle/forum/model/event_model.dart';
import 'package:recycle/forum/model/comment_model.dart';

Future<Event> fetchEvent(int id) async {
  var url = Uri.parse('https://pbp-d01.up.railway.app/forum/json/event/$id/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object Event
  return Event.fromJson(data);
}

Future<List<Comment>> fetchComment(int id) async {
  var url = Uri.parse('https://pbp-d01.up.railway.app/forum/json/$id/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object Comment
  List<Comment> listComment = [];
  for (var d in data) {
    if (d != null) {
      listComment.add(Comment.fromJson(d));
    }
  }

  return listComment;
}

Future<int> addComment(int eventIndex, int commentIndex, String commentText) async {
  var url = Uri.parse(
      'https://pbp-d01.up.railway.app/forum/add/${eventIndex}/${commentIndex}/');

  var response = await http.post(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json; charset=utf-8",
    },
    body: jsonEncode({'comment_text': commentText}),
  );
  return response.statusCode;
}
