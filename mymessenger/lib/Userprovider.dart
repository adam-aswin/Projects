import 'package:flutter/foundation.dart';

class Userprovider with ChangeNotifier {
  String? _uid;

  String? get uid => _uid;

  void setUid(String uid) {
    _uid = uid;
    notifyListeners();
  }
}
