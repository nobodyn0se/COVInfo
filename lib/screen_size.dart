import 'package:flutter/widgets.dart';

class ScreenSize {
  //to get MediaQuery dimensions for scalable elements

  static late MediaQueryData _mediaQueryData;
  static late double screenHeight;
  static late double screenWidth;
  static double? blockWidth;
  static late double blockHeight;

  static late double _safeAreaLateral; //horizontal
  static late double _safeAreaVertical;
  static late double safeHeight;
  static late double safeWidth;

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
