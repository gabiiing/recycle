import 'dart:convert';
import '../model/event.dart';
import 'package:http/http.dart' as http;

class EventMethod {
// get all events data
  Future<List<Event>> getAllEvents() async {
    var url = Uri.parse('https://pbp-d01.up.railway.app/event/json-all/');
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
    List<Event> events = [];
    for (var i in data) {
      Event event = Event.fromJson(i);
      events.add(event);
    }

    return events;
  }

// get user events data
  Future<List<Event>> getMyEvents(int id) async {
    var url = Uri.parse('https://pbp-d01.up.railway.app/event/json-your/$id/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
      },
    );
    //cek http response
    print(response.statusCode);

    var data = jsonDecode(utf8.decode(response.bodyBytes));
    print(data);
    List<Event> events = [];
    for (var i in data) {
      Event event = Event.fromJson(i);
      events.add(event);
    }

    return events;
  }

// get event data by id
  Future<Event> getEventById(int id) async {
    var url = Uri.parse('https://pbp-d01.up.railway.app/event/show/$id/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
      },
    );
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    Event event = Event.fromJson(data);
    return event;
  }

// get past events data
  Future<List<Event>> getPastEvents() async {
    var url = Uri.parse('https://pbp-d01.up.railway.app/event/json-past/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
      },
    );
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<Event> events = [];
    for (var i in data) {
      Event event = Event.fromJson(i);
      events.add(event);
    }

    return events;
  }

//get upcoming events data
  Future<List<Event>> getUpcomingEvents() async {
    var url = Uri.parse('https://pbp-d01.up.railway.app/event/json-upcoming/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
      },
    );
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<Event> events = [];
    for (var i in data) {
      Event event = Event.fromJson(i);
      events.add(event);
    }

    return events;
  }

// get ongoing events data
  Future<List<Event>> getOngoingEvents() async {
    var url = Uri.parse('https://pbp-d01.up.railway.app/event/json-ongoing/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
      },
    );
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<Event> events = [];
    for (var i in data) {
      Event event = Event.fromJson(i);
      events.add(event);
    }

    return events;
  }

// create event
  Future<dynamic> addEvent(Event event) async {
    var url =
        Uri.parse('https://pbp-d01.up.railway.app/event/add-event/');
    var response = await http.post(url,
        headers: {
          "Access-Control_Allow_Origin": "*",
          "Content-Type": "application/json; charset=utf-8",
        },
        body: jsonEncode(event));
    return jsonDecode(response.body)["success"];
  }
}

// delete event
Future<dynamic> deleteEvent(int id) async {
    var url = Uri.parse('https://pbp-d01.up.railway.app/event/delete-event/$id/');
    var response = await http.delete(
      url,
    );
    return jsonDecode(response.body)["success"];
  }