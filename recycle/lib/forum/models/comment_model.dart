// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'dart:convert';

List<Comment> commentFromJson(String str) => List<Comment>.from(json.decode(str).map((x) => Comment.fromJson(x)));

String commentToJson(List<Comment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comment {
    Comment({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
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
        required this.event,
        required this.username,
        required this.parent,
        required this.parentPk,
        required this.parentUsername,
        required this.datetime,
        required this.commentText,
    });

    int user;
    int event;
    String username;
    int? parent;
    int? parentPk;
    String? parentUsername;
    DateTime datetime;
    String commentText;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        event: json["event"],
        username: json["username"],
        parent: json["parent"],
        parentPk: json["parent_pk"],
        parentUsername: json["parent_username"],
        datetime: DateTime.parse(json["datetime"]),
        commentText: json["comment_text"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "event": event,
        "username": username,
        "parent": parent,
        "parent_pk": parentPk,
        "parent_username": parentUsername,
        "datetime": datetime.toIso8601String(),
        "comment_text": commentText,
    };
}
