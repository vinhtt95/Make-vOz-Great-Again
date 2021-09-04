import 'package:flutter/material.dart';

import '../main.dart';

Widget buildButtonIcon(AppState state) {
  if (state == AppState.free)
    return Icon(
      Icons.add,
      color: Colors.white,
    );
  else if (state == AppState.picked)
    return Icon(
      Icons.crop,
      color: Colors.white,
    );
  else if (state == AppState.cropped)
    return Icon(
      Icons.scanner_rounded,
      color: Colors.white,
    );
  else if (state == AppState.scaned)
    return Icon(
      Icons.send_rounded,
      color: Colors.white,
    );
  else if (state == AppState.sended)
    return Icon(
      Icons.clear,
      color: Colors.white,
    );
  else
    return Container();
}