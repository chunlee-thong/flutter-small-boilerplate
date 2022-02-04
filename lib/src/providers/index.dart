import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

T readProvider<T>(BuildContext context) {
  return Provider.of<T>(context, listen: false);
}

T watchProvider<T>(BuildContext context) {
  return Provider.of<T>(context, listen: true);
}
