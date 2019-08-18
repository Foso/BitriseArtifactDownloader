import 'package:bitrise_artifact_downloader/data/bitrise_api_service.dart';
import 'package:bitrise_artifact_downloader/model/BuildShowResponseModel.dart';
import 'package:bitrise_artifact_downloader/ui/artifacts/ArtifactsOverview.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/BuildResponseItemModel.dart';

class BuildDetailPage extends StatelessWidget {
  final String appSlug;
  final BuildResponseItemModel buildItem;

  const BuildDetailPage({
    Key key,
    this.appSlug,
    this.buildItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("#" + buildItem.build_number.toString() + ' BuildDetail'),
      ),
      body: _buildBody(context),
    );
  }

  FutureBuilder<Response> _buildBody(BuildContext context) {
    // FutureBuilder is perfect for easily building UI when awaiting a Future
    // Response is the type currently returned by all the methods of BitriseApiService
    return FutureBuilder<Response<BuildShowResponseModel>>(
      // In real apps, use some sort of state management (BLoC is cool)
      // to prevent duplicate requests when the UI rebuilds
      future: Provider.of<BitriseApiService>(context)
          .getBuildById(appSlug, buildItem.slug),
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
          return _buildPosts(context, posts);
        } else {
          // Show a loading indicator while waiting for the posts
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildPosts(BuildContext context, BuildResponseItemModel posts) {
    return ListView.builder(
      itemCount: 1,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
            elevation: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(posts.branch),
                Text(posts.commit_message ?? "No commit message"),
                Text(posts.finished_at),
                Text(posts.status_text),
                RaisedButton(
                  child: Text('Open Artifacts'),
                  onPressed: () {
                    _navigateToPost(context);
                  },
                ),
              ],
            ));
      },
    );
  }

  void _navigateToPost(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            ArtifactsOverview(appSlug: appSlug, buildSlug: buildItem.slug),
      ),
    );
  }
}
