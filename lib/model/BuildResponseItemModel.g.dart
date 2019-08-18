// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BuildResponseItemModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuildResponseItemModel _$BuildResponseItemModelFromJson(
    Map<String, dynamic> json) {
  return BuildResponseItemModel(
    json['branch'] as String,
    json['commit_message'] as String,
    json['slug'] as String,
    json['status_text'] as String,
    json['finished_at'] as String,
    json['workflow'] as String,
    build_number: json['build_number'] as int,
  );
}

Map<String, dynamic> _$BuildResponseItemModelToJson(
        BuildResponseItemModel instance) =>
    <String, dynamic>{
      'build_number': instance.build_number,
      'branch': instance.branch,
      'status_text': instance.status_text,
      'finished_at': instance.finished_at,
      'commit_message': instance.commit_message,
      'slug': instance.slug,
      'workflow': instance.workflow,
    };
