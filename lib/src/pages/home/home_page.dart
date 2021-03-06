import 'package:flutter/material.dart';
import 'package:future_manager/future_manager.dart';
import 'package:sura_flutter/sura_flutter.dart';

import '../../constant/text_style.dart';
import '../../utils/exception_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FutureManager<int> futureManager = FutureManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Throw error"),
              onPressed: () async {
                await ExceptionHandler.run(
                  context,
                  () async {
                    LoadingOverlayProvider.toggle();
                    await Future.delayed(const Duration(seconds: 2));
                    throw "This is an error";
                  },
                );
                LoadingOverlayProvider.toggle();
              },
            ),
            const SpaceY(32),
            Text(
              "Title but Responsive",
              style: kTitleStyle.responsiveFontSize,
            ),
          ],
        ),
      ),
    );
  }
}
