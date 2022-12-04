import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:recycle/forum/model/event_model.dart';

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
