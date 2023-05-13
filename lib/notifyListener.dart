import 'package:flutter/material.dart';

class LoadingControl with ChangeNotifier {
  void add_loading() {
    // CONSUMER  لل  REBUILD تعمل  
    notifyListeners();
  }
}
