import 'package:bitrise_artifact_downloader/data/bitrise_api_service.dart';
import 'package:bitrise_artifact_downloader/model/ArtifactShowResponseModel.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ArtifactDetailPage extends StatelessWidget {
  final String appSlug;
  final String buildSlug;
  final String artifactSlug;

  const ArtifactDetailPage({
    Key key,
    this.appSlug,
    this.buildSlug,
    this.artifactSlug,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ArtifactDetailPage'),
      ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add)),
    );
  }

  FutureBuilder<Response> _buildBody(BuildContext context) {
    return FutureBuilder<Response<ArtifactShowResponseModel>>(
      future: Provider.of<BitriseApiService>(context)
          .getArtifactBySlug(appSlug, buildSlug, artifactSlug),
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

          final posts = snapshot.data.body;
          return _buildPosts(context, posts);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildPosts(BuildContext context, ArtifactShowResponseModel posts) {
    return ListView.builder(
      itemCount: 1,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
            elevation: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(posts.data.title),
                RaisedButton(
                  child: Text('Download file in browser'),
                  onPressed: () async {
                    _launchURL(posts.data.expiringdownloadUrl);
                  },
                ),
              ],
            ));
      },
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
