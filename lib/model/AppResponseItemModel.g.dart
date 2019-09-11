// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppResponseItemModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppResponseItemModel _$AppResponseItemModelFromJson(Map<String, dynamic> json) {
  return AppResponseItemModel(
    json['project_type'] as String,
    json['slug'] as String,
    title: json['title'] as String,
    avatar_url: json['avatar_url'] as String,
  );
}

Map<String, dynamic> _$AppResponseItemModelToJson(
        AppResponseItemModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'avatar_url': instance.avatar_url,
      'project_type': instance.project_type,
      'slug': instance.slug,
    };
