import 'package:bitrise_artifact_downloader/data/bitrise_api_service.dart';
import 'package:bitrise_artifact_downloader/model/AppResponseItemModel.dart';
import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';
import 'package:provider/provider.dart';

import '../../model/AppListResponseModel.dart';
import '../builds/BuildsOverviewPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bitrise Artifacts Downloader')),
      body: _buildBody(context),
    );
  }

  FutureBuilder<Response> _buildBody(BuildContext context) {
    return FutureBuilder<Response<AppListResponseModel>>(
      future: Provider.of<BitriseApiService>(context).getApps(),
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
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildItems(BuildContext context, List<AppResponseItemModel> items) {
    return ListView.builder(
      itemCount: items.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
              items[index].title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(items[index].title),
            onTap: () => _navigateToBuildsOverviewPage(context, items[index]),
          ),
        );
      },
    );
  }

  void _navigateToBuildsOverviewPage(BuildContext context, AppResponseItemModel appResponseItemModel) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BuildsOverviewPage(appResponseItemModel: appResponseItemModel),
      ),
    );
  }
}
