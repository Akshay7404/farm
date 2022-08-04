import 'package:flutter/material.dart';

Future pushScreen(
    BuildContext context, Widget Function() navigationclass) async {
  return await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => navigationclass()),
  );
}

Future pushReplacmentScreen(
    BuildContext context, Widget Function() navigationclass) async {
  return await Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => navigationclass()),
  );
}