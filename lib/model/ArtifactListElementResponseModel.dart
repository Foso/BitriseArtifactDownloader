import 'dart:convert';

import 'package:built_value/built_value.dart' as prefix0;
import 'package:json_annotation/json_annotation.dart';

part 'ArtifactListElementResponseModel.g.dart';

@JsonSerializable(nullable: true)
class ArtifactListElementResponseModel {
  final String title;
  final String slug;

  ArtifactListElementResponseModel(this.title, this.slug);

  factory ArtifactListElementResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ArtifactListElementResponseModelFromJson(json);
  }

  static const fromJsonFactory = _$ArtifactListElementResponseModelFromJson;

  Map<String, dynamic> toJson() =>
      _$ArtifactListElementResponseModelToJson(this);
}
