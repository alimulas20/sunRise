import 'package:flutter/cupertino.dart';


void backScreen(context) {
  Navigator.pop(context);
}

void nextScreen(context, page) {
  Navigator.of(context).push(CupertinoPageRoute(
      builder: (context) => page,
  ),
  );
}

void nextScreenCloseOthers(context, page) {
  Navigator.pushAndRemoveUntil(context,
      CupertinoPageRoute(builder: (context) => page,
      ), (route) => false);
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, CupertinoPageRoute(builder: (context) => page,
  ));
}
