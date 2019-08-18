import 'package:bitrise_artifact_downloader/data/bitrise_api_service.dart';
import 'package:bitrise_artifact_downloader/model/ArtifactListElementResponseModel.dart';
import 'package:bitrise_artifact_downloader/model/ArtifactListResponseModel.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ArtifactDetailPage.dart';

class ArtifactsOverview extends StatelessWidget {
  final String appSlug;
  final String buildSlug;

  const ArtifactsOverview({
    Key key,
    this.appSlug,
    this.buildSlug,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ArtifactsOverview'),
      ),
      body: _buildBody(context),
    );
  }

  FutureBuilder<Response> _buildBody(BuildContext context) {
    return FutureBuilder<Response<ArtifactListResponseModel>>(
      future: Provider.of<BitriseApiService>(context)
          .getArtifacts(appSlug, buildSlug),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
              ),
            );
          }

          final posts = snapshot.data.body.data;
          return _buildItems(context, posts);
        } else {
          // Show a loading indicator while waiting for the posts
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildItems(
      BuildContext context, List<ArtifactListElementResponseModel> items) {
    return ListView.builder(
      itemCount: items.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              _navigateToArtifactDetailPage(context, items[index].slug);
            },
            child: Card(
                elevation: 4,
                margin: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(items[index].title,textScaleFactor: 1.3),
                  IconButton( icon: Icon(Icons.file_download))
                  ],
                )));
      },
    );
  }

  void _navigateToArtifactDetailPage(BuildContext context, String slug) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ArtifactDetailPage(
            appSlug: appSlug, buildSlug: buildSlug, artifactSlug: slug),
      ),
    );
  }
}
