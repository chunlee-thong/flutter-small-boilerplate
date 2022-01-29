import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sentry/sentry.dart';

import '../widgets/ui_helper.dart';

class ExceptionHandler {
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
      recordError(message: exception, stackTrace: stackTrace);
      onError?.call(exception);
      return null;
    } finally {
      onDone?.call();
    }
  }

  ///Record error to Analytic or Crashlytic
  static void recordError({required message, dynamic stackTrace}) {
    Sentry.captureException(message, stackTrace: stackTrace);
  }

  static void handleManagerError(dynamic exception, BuildContext context) {
    recordError(
      message: exception,
      stackTrace: exception.stackTrace,
    );
  }
}
