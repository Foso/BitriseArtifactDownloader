import 'package:json_annotation/json_annotation.dart';

import 'BuildResponseItemModel.dart';

part 'BuildShowResponseModel.g.dart';

@JsonSerializable(nullable: true)
class BuildShowResponseModel {
  final BuildResponseItemModel data;

//  final String paging;
  BuildShowResponseModel({this.data});

  static const fromJsonFactory = _$BuildShowResponseModelFromJson;

  factory BuildShowResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BuildShowResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BuildShowResponseModelToJson(this);
}
