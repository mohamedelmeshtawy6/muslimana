// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AzkarModel azkarFromJson(String str) => AzkarModel.fromJson(json.decode(str));

String azkarToJson(AzkarModel data) => json.encode(data.toJson());

class AzkarModel {
  String title;
  List<Content> content;

  AzkarModel({
    required this.title,
    required this.content,
  });

  factory AzkarModel.fromJson(Map<String, dynamic> json) => AzkarModel(
        title: json["title"],
        content:
            List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
      };
}

class Content {
  String zekr;
  int repeat;
  String bless;

  Content({
    required this.zekr,
    required this.repeat,
    required this.bless,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        zekr: json["zekr"],
        repeat: json["repeat"],
        bless: json["bless"],
      );

  Map<String, dynamic> toJson() => {
        "zekr": zekr,
        "repeat": repeat,
        "bless": bless,
      };
}
