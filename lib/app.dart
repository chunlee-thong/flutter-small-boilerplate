import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sura_flutter/sura_flutter.dart';

import 'src/constant/app_theme_color.dart';
import 'src/pages/home/home_page.dart';
import 'src/utils/exception_handler.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: const [],
      child: SuraProvider(
        onFutureManagerError: ExceptionHandler.handleManagerError,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: AppColor.primaryMaterial,
          ),
          home: const HomePage(),
          builder: (context, child) {
            return _AppWrapper(child: child!);
          },
        ),
      ),
    );
  }
}

class _AppWrapper extends StatelessWidget {
  final Widget child;
  const _AppWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = context.theme;
    return SuraResponsiveBuilder(
      builder: (context) {
        return Theme(
          data: theme.copyWith(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(
                  64,
                  SuraResponsive.value(42, 52, 62),
                ),
              ),
            ),
            textTheme: theme.textTheme.copyWith(
              labelLarge: theme.textTheme.labelLarge?.responsiveFontSize,
              titleMedium: theme.textTheme.titleMedium?.responsiveFontSize,
              titleSmall: theme.textTheme.titleSmall?.responsiveFontSize,
              bodyMedium: theme.textTheme.bodyMedium?.responsiveFontSize,
              bodySmall: theme.textTheme.bodySmall?.responsiveFontSize,
            ),
          ),
          child: LoadingOverlayBuilder(child: child),
        );
      },
    );
  }
}
