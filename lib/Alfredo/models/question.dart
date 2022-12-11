// To parse this JSON data, do
//
//     final question = questionFromJson(jsonString);

import 'dart:convert';

List<Question> questionFromJson(String str) =>
    List<Question>.from(json.decode(str).map((x) => Question.fromJson(x)));

String questionToJson(List<Question> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Question {
  Question({
    this.model,
    this.pk,
    this.fields,
  });

  String? model;
  int? pk;
  Fields? fields;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields!.toJson(),
      };
}

class Fields {
  Fields({
    this.user,
    this.date,
    this.title,
    this.description,
  });

  int? user;
  DateTime? date;
  String? title;
  String? description;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        date: DateTime.parse(json["date"]),
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "date": date!.toIso8601String(),
        "title": title,
        "description": description,
      };
}
