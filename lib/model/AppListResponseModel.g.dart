// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppListResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppListResponseModel _$AppListResponseModelFromJson(Map<String, dynamic> json) {
  return AppListResponseModel(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : AppResponseItemModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AppListResponseModelToJson(
        AppListResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
