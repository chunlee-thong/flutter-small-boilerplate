import 'package:flutter/material.dart';
import 'package:sura_flutter/sura_flutter.dart';

import 'src/constant/app_theme_color.dart';
import 'src/pages/home/home_page.dart';
import 'src/utils/exception_handler.dart';
import 'src/widgets/loading_overlay.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SuraProvider(
      onFutureManagerError: ExceptionHandler.handleManagerError,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: AppColor.primaryMaterial,
        ),
        home: const HomePage(),
        builder: (context, child) {
          return LoadingOverlay(
            child: child!,
          );
        },
      ),
    );
  }
}
