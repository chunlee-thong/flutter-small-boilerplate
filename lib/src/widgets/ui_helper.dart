import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sura_flutter/sura_flutter.dart';

import '../utils/app_utils.dart';

class UIHelper {
  static Future showErrorDialog(BuildContext context, dynamic exception) async {
    String errorMessage = AppUtils.getReadableErrorMessage(exception);
    return await showDialog(
      context: context,
      builder: (context) => SuraSimpleDialog(content: errorMessage, title: "Error"),
    );
  }

  ///Context is unused but keep if there will be any future change
  static void showToast(BuildContext context, String message) {
    Fluttertoast.showToast(msg: message);
  }
}
