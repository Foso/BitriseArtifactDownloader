import 'package:bitrise_artifact_downloader/data/bitrise_api_service.dart';
import 'package:bitrise_artifact_downloader/model/AppResponseItemModel.dart';
import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';
import 'package:provider/provider.dart';

import '../../model/AppListResponseModel.dart';
import '../builds/BuildsOverviewPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bitrise Artifacts Downloader'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () =>_showApiTokenInputDialog(context),
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () { setState(() {
              // reload
            }); },
          )
        ],
      ),
      body: _buildBody(context)
    );
  }

  Future<Widget> _showApiTokenInputDialog(BuildContext context) async {
    final textEditingController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update Bitrise API token'),
          content: TextField(
            controller: textEditingController,
            autofocus: true,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Set'),
              onPressed: () {
                BitriseApiService.token = textEditingController.text.trim();
                FocusScope.of(context).unfocus();
                Navigator.of(context).pop();
                setState(() {
                  // reload
                });
              },
            )
          ],
        );
      }
    );
  }

  FutureBuilder<Response> _buildBody(BuildContext context) {
    return FutureBuilder<Response<AppListResponseModel>>(
      future: Provider.of<BitriseApiService>(context).getApps(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError || snapshot.data.body == null) {
            return Center(
              child: Text(
                (snapshot.error ?? 'Unknown error!\n(Check your API token)').toString(),
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
            leading: items[index].avatar_url == null ? null : Image.network(items[index].avatar_url),
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
