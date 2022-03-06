import 'package:flutter/material.dart';
import 'package:sura_flutter/sura_flutter.dart';

import '../../constant/text_style.dart';
import '../../utils/exception_handler.dart';
import '../../widgets/loading_overlay.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    LoadingOverlayProvider.toggleLoading();
                    await Future.delayed(const Duration(seconds: 2));
                    throw "This is an error";
                  },
                );
                LoadingOverlayProvider.toggleLoading();
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
