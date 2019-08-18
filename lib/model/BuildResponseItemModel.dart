import 'dart:convert';

import 'package:built_value/built_value.dart' as prefix0;
import 'package:json_annotation/json_annotation.dart';

part 'BuildResponseItemModel.g.dart';

@JsonSerializable(nullable: true)
class BuildResponseItemModel {
  final int build_number;
  final String branch;
  final String status_text;
  final String finished_at;
  final String commit_message;
  final String slug;
  final String workflow;

  BuildResponseItemModel(this.branch, this.commit_message, this.slug,
      this.status_text, this.finished_at, this.workflow,
      {this.build_number});

  factory BuildResponseItemModel.fromJson(Map<String, dynamic> json) {
    return _$BuildResponseItemModelFromJson(json);
  }

  static const fromJsonFactory = _$BuildResponseItemModelFromJson;

  Map<String, dynamic> toJson() => _$BuildResponseItemModelToJson(this);
}
