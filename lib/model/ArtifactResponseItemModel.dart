import 'package:json_annotation/json_annotation.dart';

part 'ArtifactResponseItemModel.g.dart';

@JsonSerializable(nullable: true)
class ArtifactResponseItemModel {
  final String title;
  final String artifact_type;
  @JsonKey(name: 'expiring_download_url')
  final String expiringdownloadUrl;

//  final String paging;
  ArtifactResponseItemModel(this.expiringdownloadUrl, this.artifact_type,
      {this.title});

  static const fromJsonFactory = _$ArtifactResponseItemModelFromJson;

  factory ArtifactResponseItemModel.fromJson(Map<String, dynamic> json) =>
      _$ArtifactResponseItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArtifactResponseItemModelToJson(this);
}
