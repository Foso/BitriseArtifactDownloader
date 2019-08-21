import 'dart:convert';

import 'package:bitrise_artifact_downloader/data/bitrise_api_service.dart';
import 'package:bitrise_artifact_downloader/model/AppResponseItemModel.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/BuildListResponseModel.dart';
import '../../model/BuildResponseItemModel.dart';
import '../../model/AppListResponseModel.dart';
import 'BuildDetailPage.dart';

class BuildsOverviewPage extends StatefulWidget {
  final AppResponseItemModel appResponseItemModel;

  const BuildsOverviewPage({
    Key key,
    this.appResponseItemModel
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BuildsOverviewPageState();
}

class _BuildsOverviewPageState extends State<BuildsOverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appResponseItemModel.title + ' - ' + 'Builds Overview'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () { setState(() {
              // reload
            }); },
          )
        ],
      ),
      body: _buildBody(context),
    );
  }

  FutureBuilder<Response> _buildBody(BuildContext context) {
    return FutureBuilder<Response<BuildListResponseModel>>(
      future: Provider.of<BitriseApiService>(context).getBuilds(widget.appResponseItemModel.slug),
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

  ListView _buildItems(BuildContext context,
      List<BuildResponseItemModel> buildResponseItemModels) {
    return ListView.builder(
      itemCount: buildResponseItemModels.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            _navigateToBuildDetailPage(context, buildResponseItemModels[index]);
          },
          child: Card(
            elevation: 4,
            child: Column(
              children: <Widget>[
                Text(
                  "#" +
                      (buildResponseItemModels[index].build_number.toString()),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("Status: " +
                    (buildResponseItemModels[index].status_text ??
                        "no workflow specified")),
                Text("Workflow: " +
                    (buildResponseItemModels[index].workflow ??
                        "no workflow specified")),
                Text("CommitMessage: " +
                    (buildResponseItemModels[index].commit_message ??
                        "no message specified"))
              ],
            ),
          ),
        );
      },
    );
  }

  void _navigateToBuildDetailPage(BuildContext context, BuildResponseItemModel buildResponseItemModel) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            BuildDetailPage(appSlug: widget.appResponseItemModel.slug, buildItem: buildResponseItemModel),
      ),
    );
  }
}
