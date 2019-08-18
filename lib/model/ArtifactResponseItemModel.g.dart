// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArtifactResponseItemModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtifactResponseItemModel _$ArtifactResponseItemModelFromJson(
    Map<String, dynamic> json) {
  return ArtifactResponseItemModel(
    json['expiring_download_url'] as String,
    json['artifact_type'] as String,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$ArtifactResponseItemModelToJson(
        ArtifactResponseItemModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'artifact_type': instance.artifact_type,
      'expiring_download_url': instance.expiringdownloadUrl,
    };
