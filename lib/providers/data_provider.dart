import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import '../models/data.dart';

class data_provider with ChangeNotifier {
  void reload() {
    notifyListeners();
  }
}
