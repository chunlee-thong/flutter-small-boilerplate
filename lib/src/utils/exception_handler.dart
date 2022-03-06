import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sentry/sentry.dart';

import '../widgets/ui_helper.dart';

class ExceptionHandler {
  ///Run the try/catch method
  static Future<T?> run<T>(
    BuildContext? context,
    FutureOr<T> Function() function, {
    void Function(dynamic)? onError,
    VoidCallback? onDone,
  }) async {
    try {
      return await function();
    } catch (exception, stackTrace) {
      if (context != null) {
        UIHelper.showErrorDialog(context, exception);
      }
      recordError(exception, stackTrace: stackTrace);
      onError?.call(exception);
      return null;
    } finally {
      onDone?.call();
    }
  }

  static void recordError(dynamic exception, {StackTrace? stackTrace}) {
    stackTrace ??= exception is Error ? exception.stackTrace : null;
    if (kDebugMode) {
      Sentry.captureException(exception, stackTrace: stackTrace);
    }
  }

  static void handleManagerError(dynamic exception, BuildContext context) {
    recordError(exception);
  }
}
