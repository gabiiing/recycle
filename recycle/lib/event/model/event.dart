// To parse this JSON data, do

//     final event = eventFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Event> eventFromJson(String str) => List<Event>.from(json.decode(str).map((x) => Event.fromJson(x)));

String eventToJson(List<Event> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Event {
    Event({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.user,
        required this.createDate,
        required this.startDate,
        required this.finishDate,
        required this.title,
        required this.brief,
        required this.description,
    });

    int user;
    DateTime createDate;
    DateTime startDate;
    DateTime finishDate;
    String title;
    String brief;
    String description;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        createDate: DateTime.parse(json["create_date"]),
        startDate: DateTime.parse(json["start_date"]),
        finishDate: DateTime.parse(json["finish_date"]),
        title: json["title"],
        brief: json["brief"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "create_date": createDate.toIso8601String(),
        "start_date": startDate.toIso8601String(),
        "finish_date": finishDate.toIso8601String(),
        "title": title,
        "brief": brief,
        "description": description,
    };
}


// class Event{
//   late int user;
//   late String title;
//   late String description;
//   late String brief;
//   late DateTime startDate;
//   late DateTime finishDate;
//   late DateTime createDate;

//   Event({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.brief,
//     required this.startDate,
//     required this.finishDate,
//     required this.createDate,
//     required this.user,
//   });

//   factory Event.fromJson(Map<String, dynamic> json) => Event(
//     id: json["id"],
//     title: json["title"],
//     description: json["description"],
//     brief: json["brief"],
//     startDate: DateTime.parse(json["start_date"]),
//     finishDate: DateTime.parse(json["finish_date"]),
//     createDate: DateTime.parse(json["create_date"]),
//     user: json["user"],
//   );

//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "description": description,
//     "brief": brief,
//     "start_date": startDate,
//     "finish_date": finishDate,
//     "create_date": createDate,
//     "user": user,
//   };
// }