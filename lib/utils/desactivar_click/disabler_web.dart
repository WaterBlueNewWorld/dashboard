import 'dart:html';

/// https://stackoverflow.com/questions/75593542/disable-default-right-click-on-web-in-flutter
void disableRightClick() {
  document.onContextMenu.listen((e) => e.preventDefault());
}