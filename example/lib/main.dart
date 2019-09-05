import 'package:example/widgets/example_card.dart';
import 'package:flutter/material.dart';
import 'package:sup/sup.dart';

import 'package:example/examples.dart';
import 'package:example/sup_configs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sup Gallery',
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          brightness: Brightness.light,
          centerTitle: true,
          title: Text(
            'Sup Gallery',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: PageView(
          children: <Widget>[
            ExampleCard(
              child: FullPageCampingSup(),
              defaultBrightness: Brightness.dark,
            ),
            ExampleCard(
              child: FullPageFoodSup(),
              defaultBrightness: Brightness.dark,
            ),
            ExampleCard(
              child: WelcomeSup(),
            ),
            ExampleCard(
              child: ConnectionErrorSup(),
              switchEnabled: true,
            ),
            ExampleCard(
              child: Sup.from(SupConfigs.error),
              defaultBrightness: Brightness.dark,
              switchEnabled: true,
            ),
            ExampleCard(
              child: NoItemsSup(),
              backgroundColor: Color(0xffFDEEE0),
            ),
            ExampleCard(
              child: NoMessagesSup(),
              switchEnabled: true,
            ),
            ExampleCard(
              child: QuickSup.error(
                title: 'Quick error',
                subtitle: 'This is an example of QuickSup.error',
                onRetry: () {},
                retryText: 'RETRY',
              ),
              defaultBrightness: Brightness.dark,
              switchEnabled: true,
            ),
            ExampleCard(
              child: QuickSup.empty(
                title: 'Quick empty',
                subtitle: 'This is an example of QuickSup.empty',
              ),
              switchEnabled: true,
            ),
            ExampleCard(
              child: Sup(),
              switchEnabled: true,
            ),
          ],
        ),
      ),
    );
  }
}
