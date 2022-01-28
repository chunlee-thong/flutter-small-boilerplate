import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app.dart';

void main() {
  runZonedGuarded(() async {
    await SentryFlutter.init(
      (options) {
        options.dsn = '';
      },
    );

    runApp(const MyApp());
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
}
