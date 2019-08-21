import 'dart:async';

import 'package:bitrise_artifact_downloader/model/AppListResponseModel.dart';
import 'package:bitrise_artifact_downloader/model/ArtifactListResponseModel.dart';
import 'package:bitrise_artifact_downloader/model/ArtifactShowResponseModel.dart';
import 'package:bitrise_artifact_downloader/model/BuildListResponseModel.dart';
import 'package:bitrise_artifact_downloader/model/BuildShowResponseModel.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'JsonSerializableConverter.dart';

part 'bitrise_api_service.chopper.dart';

@ChopperApi()
abstract class BitriseApiService extends ChopperService {
  static const _tokenKey = "token";
  static final authInterceptor =
      (Request request) async => applyHeader(request, 'Authorization', await FlutterSecureStorage().read(key: _tokenKey));

  static set token(String token) {
    FlutterSecureStorage().write(key: _tokenKey, value: token);
  }

  @Get(path: "apps")
  Future<Response<AppListResponseModel>> getApps();

  @Get(path: "apps/{appslug}/builds")
  Future<Response<BuildListResponseModel>> getBuilds(@Path() String appslug);

  @Get(path: "apps/{appslug}/builds/{buildslug}")
  Future<Response<BuildShowResponseModel>> getBuildById(
      @Path() String appslug, @Path() String buildslug);

  @Get(path: "apps/{appslug}/builds/{buildslug}/artifacts")
  Future<Response<ArtifactListResponseModel>> getArtifacts(
      @Path() String appslug, @Path() String buildslug);

  @Get(path: "apps/{appslug}/builds/{buildslug}/artifacts/{artifactslug}")
  Future<Response<ArtifactShowResponseModel>> getArtifactBySlug(
      @Path() String appslug,
      @Path() String buildslug,
      @Path() String artifactslug);

  static BitriseApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://api.bitrise.io/v0.1/',
      services: [
        _$BitriseApiService(),
      ],
      converter: converter,
      interceptors: [
        HttpLoggingInterceptor(),
        authInterceptor
      ],
    );
    return _$BitriseApiService(client);
  }
}
