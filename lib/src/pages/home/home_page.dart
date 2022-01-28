import 'package:flutter/material.dart';
import '../../providers/loading_overlay_provider.dart';
import '../../utils/exception_handler.dart';
import 'package:sura_flutter/sura_flutter.dart';

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
        child: SuraAsyncButton(
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
      ),
    );
  }
}
