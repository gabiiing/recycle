// To parse this JSON data, do
//
//     final event = eventFromJson(jsonString);

import 'dart:convert';

Event eventFromJson(String str) => Event.fromJson(json.decode(str));

String eventToJson(Event data) => json.encode(data.toJson());

class Event {
    Event({
        required this.username,
        required this.title,
        required this.startDate,
        required this.finishDate,
        required this.description,
    });

    String username;
    String title;
    DateTime startDate;
    DateTime finishDate;
    String description;

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        username: json["username"],
        title: json["title"],
        startDate: DateTime.parse(json["start_date"]),
        finishDate: DateTime.parse(json["finish_date"]),
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "title": title,
        "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "finish_date": "${finishDate.year.toString().padLeft(4, '0')}-${finishDate.month.toString().padLeft(2, '0')}-${finishDate.day.toString().padLeft(2, '0')}",
        "description": description,
    };
}
