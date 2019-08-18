// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArtifactShowResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtifactShowResponseModel _$ArtifactShowResponseModelFromJson(
    Map<String, dynamic> json) {
  return ArtifactShowResponseModel(
    json['data'] == null
        ? null
        : ArtifactResponseItemModel.fromJson(
            json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ArtifactShowResponseModelToJson(
        ArtifactShowResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
