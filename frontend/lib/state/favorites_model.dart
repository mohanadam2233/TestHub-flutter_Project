import 'package:flutter/foundation.dart';

class FavoritesModel extends ChangeNotifier {
  final Set<String> _ids = {};

  bool isFav(String id) => _ids.contains(id);
  List<String> get ids => _ids.toList();

  void toggle(String id) {
    if (_ids.contains(id)) {
      _ids.remove(id);
    } else {
      _ids.add(id);
    }
    notifyListeners();
  }

  void clear() {
    _ids.clear();
    notifyListeners();
  }
}
