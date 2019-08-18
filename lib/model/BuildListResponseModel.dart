import 'package:json_annotation/json_annotation.dart';

import 'BuildResponseItemModel.dart';

part 'BuildListResponseModel.g.dart';

@JsonSerializable(nullable: true)
class BuildListResponseModel {
  final List<BuildResponseItemModel> data;

//  final String paging;
  BuildListResponseModel({this.data});

  static const fromJsonFactory = _$BuildListResponseModelFromJson;

  factory BuildListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BuildListResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BuildListResponseModelToJson(this);
}
