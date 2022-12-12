import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:recycle/forum/models/event_model.dart';
import 'package:recycle/forum/models/comment_model.dart';

Future<Event> fetchEvent(int id) async {
  var url = Uri.parse('https://pbp-d01.up.railway.app/forum/json/event/$id/');
  var response = await http.get(url);

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object Event
  return Event.fromJson(data);
}

Future<List<Comment>> fetchComment(int id) async {
  var url = Uri.parse('https://pbp-d01.up.railway.app/forum/json/$id/');
  await Future.delayed(const Duration(seconds: 1));
  var response = await http.get(url);

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

Future<dynamic> addComment(dynamic request, int eventIndex, int commentIndex,
    String commentText) async {
  await request.post(
      'https://pbp-d01.up.railway.app/forum/add/$eventIndex/$commentIndex/',
      {'comment_text': commentText});
}

Future<dynamic> deleteComment(dynamic request, int commentIndex) async {
  await request
      .post('https://pbp-d01.up.railway.app/forum/delete/$commentIndex/', {});
}
