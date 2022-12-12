import 'dart:convert';
import 'package:recycle/adminpage/models/feedbackmodel.dart';
import 'package:http/http.dart' as http;

class FeedbackMethod {
  Future<List<Fdback>> getAllFeedback() async {
    var url = Uri.parse('https://pbp-d01.up.railway.app/adminpage/get_data/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
      },
    );
    print(response.statusCode);
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    print(data);
    List<Fdback> feedbacks = [];
    for (var i in data) {
      Fdback feedback = Fdback.fromJson(i);
      feedbacks.add(feedback);
    }

    return feedbacks;
  }
}
