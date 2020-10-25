import 'package:flutter/widgets.dart';

class ScreenSize {
  //to get MediaQuery dimensions for scalable elements

  static MediaQueryData _mediaQueryData;
  static double screenHeight;
  static double screenWidth;
  static double blockWidth;
  static double blockHeight;

  static double _safeAreaLateral; //horizontal
  static double _safeAreaVertical;
  static double safeHeight;
  static double safeWidth;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    blockHeight = screenHeight / 100;
    blockWidth = screenWidth / 100;

    _safeAreaLateral =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeHeight = (screenHeight - _safeAreaVertical) / 100;
    safeWidth = (screenWidth - _safeAreaLateral) / 100; 
  }
}
