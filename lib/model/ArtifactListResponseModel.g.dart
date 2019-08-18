// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArtifactListResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtifactListResponseModel _$ArtifactListResponseModelFromJson(
    Map<String, dynamic> json) {
  return ArtifactListResponseModel(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : ArtifactListElementResponseModel.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ArtifactListResponseModelToJson(
        ArtifactListResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
