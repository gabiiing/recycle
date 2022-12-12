// To parse this JSON data, do
//
//     final fdback = fdbackFromJson(jsonString);

import 'dart:convert';

List<Fdback> fdbackFromJson(String str) =>
    List<Fdback>.from(json.decode(str).map((x) => Fdback.fromJson(x)));

String fdbackToJson(List<Fdback> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Fdback {
  Fdback({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Fdback.fromJson(Map<String, dynamic> json) => Fdback(
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
    required this.namaAdmin,
    required this.emailAdmin,
    required this.deskripsi,
  });

  int user;
  String namaAdmin;
  String emailAdmin;
  String deskripsi;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        namaAdmin: json["nama_admin"],
        emailAdmin: json["email_admin"],
        deskripsi: json["deskripsi"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "nama_admin": namaAdmin,
        "email_admin": emailAdmin,
        "deskripsi": deskripsi,
      };
}
