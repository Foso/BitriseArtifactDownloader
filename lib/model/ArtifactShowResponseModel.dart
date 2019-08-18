import 'package:json_annotation/json_annotation.dart';

import 'ArtifactResponseItemModel.dart';

part 'ArtifactShowResponseModel.g.dart';

@JsonSerializable(nullable: true)
class ArtifactShowResponseModel {
  final ArtifactResponseItemModel data;

//  final String paging;
  ArtifactShowResponseModel(this.data);

  static const fromJsonFactory = _$ArtifactShowResponseModelFromJson;

  factory ArtifactShowResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ArtifactShowResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArtifactShowResponseModelToJson(this);
}
