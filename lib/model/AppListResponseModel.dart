import 'package:json_annotation/json_annotation.dart';

import 'AppResponseItemModel.dart';

part 'AppListResponseModel.g.dart';

@JsonSerializable(nullable: true)
class AppListResponseModel {
  final List<AppResponseItemModel> data;

//  final String paging;
  AppListResponseModel({this.data});

  static const fromJsonFactory = _$AppListResponseModelFromJson;

  factory AppListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AppListResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppListResponseModelToJson(this);
}
