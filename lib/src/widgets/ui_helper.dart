import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sura_flutter/sura_flutter.dart';

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

  ///Context is unused but keep if there will be any future change
  static void showToast(BuildContext context, String message) {
    Fluttertoast.showToast(msg: message);
  }
}
