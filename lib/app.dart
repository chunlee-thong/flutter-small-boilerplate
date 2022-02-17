import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sura_flutter/sura_flutter.dart';

import 'src/constant/app_theme_color.dart';
import 'src/pages/home/home_page.dart';
import 'src/providers/loading_overlay_provider.dart';
import 'src/utils/exception_handler.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoadingOverlayProvider()),
      ],
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
    final color = context.theme.brightness == Brightness.dark ? Colors.grey.withOpacity(0.2) : Colors.black26;
    LoadingOverlayProvider.init(context);
    return SuraResponsiveBuilder(
      child: Theme(
        data: Theme.of(context).copyWith(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(
                double.infinity,
                SuraResponsive.value(44, 54, 64),
              ),
            ),
          ),
        ),
        child: Stack(
          children: [
            child,
            Consumer<LoadingOverlayProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return Container(
                    child: const Center(child: CircularProgressIndicator()),
                    color: color,
                  );
                }
                return emptySizedBox;
              },
            ),
          ],
        ),
      ),
    );
  }
}
