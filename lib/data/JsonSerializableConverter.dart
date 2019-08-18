import 'package:bitrise_artifact_downloader/model/AppListResponseModel.dart';
import 'package:bitrise_artifact_downloader/model/ArtifactListResponseModel.dart';
import 'package:bitrise_artifact_downloader/model/ArtifactShowResponseModel.dart';
import 'package:bitrise_artifact_downloader/model/BuildListResponseModel.dart';
import 'package:bitrise_artifact_downloader/model/BuildResponseItemModel.dart';
import 'package:bitrise_artifact_downloader/model/BuildShowResponseModel.dart';
import 'package:chopper/chopper.dart';

typedef T JsonFactory<T>(Map<String, dynamic> json);

final converter = JsonSerializableConverter({
  AppListResponseModel: AppListResponseModel.fromJsonFactory,
  BuildListResponseModel: BuildListResponseModel.fromJsonFactory,
  BuildResponseItemModel: BuildResponseItemModel.fromJsonFactory,
  BuildShowResponseModel: BuildShowResponseModel.fromJsonFactory,
  ArtifactListResponseModel: ArtifactListResponseModel.fromJsonFactory,
  ArtifactShowResponseModel: ArtifactShowResponseModel.fromJsonFactory
});

class JsonSerializableConverter extends JsonConverter {
  final Map<Type, JsonFactory> factories;

  JsonSerializableConverter(this.factories);

  T _decodeMap<T>(Map<String, dynamic> values) {
    /// Get jsonFactory using Type parameters
    /// if not found or invalid, throw error or return null
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      /// throw serializer not found error;
      return null;
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(List values) =>
      values.where((v) => v != null).map<T>((v) => _decode<T>(v)).toList();

  dynamic _decode<T>(entity) {
    if (entity is Iterable) return _decodeList<T>(entity);

    if (entity is Map) return _decodeMap<T>(entity);

    return entity;
  }

  @override
  Response<ResultType> convertResponse<ResultType, Item>(Response response) {
    // use [JsonConverter] to decode json
    final jsonRes = super.convertResponse(response);

    return jsonRes.replace<ResultType>(body: _decode<Item>(jsonRes.body));
  }

  @override
  // all objects should implements toJson method
  Request convertRequest(Request request) => super.convertRequest(request);
}
