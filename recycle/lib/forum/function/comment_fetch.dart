import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:recycle/forum/model/comment_model.dart';

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
