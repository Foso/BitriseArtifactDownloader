import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'data/bitrise_api_service.dart';
import 'ui/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (_) => BitriseApiService.create(),
      dispose: (_, BitriseApiService service) => service.client.dispose(),
      child: MaterialApp(
        title: 'Material App',
        home: HomePage(),
      ),
    );
  }
}
