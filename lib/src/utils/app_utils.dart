import 'package:flutter/services.dart';

class AppUtils {
  static String getReadableErrorMessage(Object exception) {
    String? errorMessage;
    if (exception is PlatformException) {
      errorMessage = exception.message;
    }
    // if(exception is FirebaseAuthException){
    //   errorMessage = exception.message;
    // }

    return errorMessage ?? exception.toString();
  }
}
