// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BuildListResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuildListResponseModel _$BuildListResponseModelFromJson(
    Map<String, dynamic> json) {
  return BuildListResponseModel(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : BuildResponseItemModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BuildListResponseModelToJson(
        BuildListResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
