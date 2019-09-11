import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'AppResponseItemModel.g.dart';

@JsonSerializable(nullable: true)
class AppResponseItemModel {
  final String title;
  final String avatar_url;
  final String project_type;
  final String slug;

  AppResponseItemModel(this.project_type, this.slug, {this.title, this.avatar_url});

  factory AppResponseItemModel.fromJson(Map<String, dynamic> json) {
    return _$AppResponseItemModelFromJson(json);
  }

  static const fromJsonFactory = _$AppResponseItemModelFromJson;

  Map<String, dynamic> toJson() => _$AppResponseItemModelToJson(this);
}
