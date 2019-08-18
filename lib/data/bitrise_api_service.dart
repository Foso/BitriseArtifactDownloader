import 'package:bitrise_artifact_downloader/model/AppListResponseModel.dart';
import 'package:bitrise_artifact_downloader/model/ArtifactListResponseModel.dart';
import 'package:bitrise_artifact_downloader/model/ArtifactShowResponseModel.dart';
import 'package:bitrise_artifact_downloader/model/BuildListResponseModel.dart';
import 'package:bitrise_artifact_downloader/model/BuildShowResponseModel.dart';
import 'package:chopper/chopper.dart';
import 'JsonSerializableConverter.dart';

part 'bitrise_api_service.chopper.dart';

@ChopperApi()
abstract class BitriseApiService extends ChopperService {
  static const String token =
      "INSERT API KEY HERE";

  @Get(path: "apps", headers: const {"Authorization": token})
  Future<Response<AppListResponseModel>> getApps();

  @Get(path: "apps/{appslug}/builds", headers: const {"Authorization": token})
  Future<Response<BuildListResponseModel>> getBuilds(@Path() String appslug);

  @Get(
      path: "apps/{appslug}/builds/{buildslug}",
      headers: const {"Authorization": token})
  Future<Response<BuildShowResponseModel>> getBuildById(
      @Path() String appslug, @Path() String buildslug);

  @Get(
      path: "apps/{appslug}/builds/{buildslug}/artifacts",
      headers: const {"Authorization": token})
  Future<Response<ArtifactListResponseModel>> getArtifacts(
      @Path() String appslug, @Path() String buildslug);

  @Get(
      path: "apps/{appslug}/builds/{buildslug}/artifacts/{artifactslug}",
      headers: const {"Authorization": token})
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
      interceptors: [HttpLoggingInterceptor()],
    );
    return _$BitriseApiService(client);
  }
}
