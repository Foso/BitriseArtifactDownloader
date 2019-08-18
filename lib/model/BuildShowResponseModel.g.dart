// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BuildShowResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuildShowResponseModel _$BuildShowResponseModelFromJson(
    Map<String, dynamic> json) {
  return BuildShowResponseModel(
    data: json['data'] == null
        ? null
        : BuildResponseItemModel.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BuildShowResponseModelToJson(
        BuildShowResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
