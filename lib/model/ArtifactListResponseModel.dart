import 'package:json_annotation/json_annotation.dart';

import 'ArtifactListElementResponseModel.dart';

part 'ArtifactListResponseModel.g.dart';

@JsonSerializable(nullable: true)
class ArtifactListResponseModel {
  final List<ArtifactListElementResponseModel> data;

//  final String paging;
  ArtifactListResponseModel({this.data});

  static const fromJsonFactory = _$ArtifactListResponseModelFromJson;

  factory ArtifactListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ArtifactListResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArtifactListResponseModelToJson(this);
}
