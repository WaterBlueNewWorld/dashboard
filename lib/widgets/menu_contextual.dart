import 'package:flutter/material.dart';

void menuContextual(Offset v, BuildContext context, List<PopupMenuItem<bool>> opciones) async {
  await showMenu<bool>(
    context: context,
    position: RelativeRect.fromLTRB(
      v.dx,
      v.dy,
      v.dx,
      v.dy,
    ),
    items: opciones,
  );
}
