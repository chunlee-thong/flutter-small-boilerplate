import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sura_flutter/sura_flutter.dart';

const emptySizedBox = SizedBox();

class UIHelper {
  static Future showErrorDialog(BuildContext context, dynamic exception) async {
    String message = "";
    if (exception is PlatformException) {
      message = exception.message ?? "";
    }
    if (message.isEmpty) {
      message = exception.toString();
    }
    return await showDialog(
      context: context,
      builder: (context) => SuraSimpleDialog(content: message, title: "Error"),
    );
  }
}
