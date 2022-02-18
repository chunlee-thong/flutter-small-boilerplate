import 'package:flutter/material.dart';
import 'package:flutter_small_boilerplate/src/constant/text_style.dart';
import 'package:sura_flutter/sura_flutter.dart';

import '../../providers/loading_overlay_provider.dart';
import '../../utils/exception_handler.dart';

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
            SuraAsyncButton(
              fullWidth: false,
              child: const Text("Throw error"),
              margin: const EdgeInsets.all(64),
              onPressed: () async {
                await ExceptionHandler.run(context, () async {
                  LoadingOverlayProvider.toggleLoading();
                  await Future.delayed(const Duration(seconds: 2));
                  throw "This is an error";
                });
                LoadingOverlayProvider.toggleLoading();
              },
            ),
            Text(
              "Some Responsive Text",
              style: kTitleStyle.responsiveFontSize,
            ),
          ],
        ),
      ),
    );
  }
}
