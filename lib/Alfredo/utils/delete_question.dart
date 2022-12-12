import 'package:http/http.dart' as http;

Future<http.Response> deleteQuestion(int id) async {
  var url =
      Uri.parse('https://pbp-d01.up.railway.app/recycle/delete-question/$id/');
  final http.Response response = await http.delete(
    url,
  );

  return response;
}
