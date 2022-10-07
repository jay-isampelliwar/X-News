import 'package:flutter/cupertino.dart';

class Category extends ChangeNotifier {
  final List<String> _list = [
    "🐶 Animal",
    "🪙 Crypto",
    "🎬 Entertainment",
    "🧥 Fashion",
    "🍔 Food",
    "🤝🏼 Geopolitics",
    "🎮 Games",
    "💪🏼 Health",
    "🎶 Music",
    "🎓 Science",
    "🏀 Sport",
    "💻 Tech",
  ];
  List<String> get getCategoryList => _list;

  static const int max = 5;
  String msg = "Select any $max category";

  final List<String> _selectedCatList = [];
  List<String> get selectedCatList => _selectedCatList;

  final List<int> _select = [];
  List<int> get selectedItem => _select;

  void itemSelected(int index) {
    if (_select.length < max) {
      _select.add(index);
      _selectedCatList.add(_list[index]);
      int n = _select.length;
      msg = n == max ? "Continue" : "Select ${max - n} more";
    }
    notifyListeners();
  }

  void removeSelected(int index) {
    _select.remove(index);
    _selectedCatList.remove(_list[index]);
    int n = _select.length;
    if (n < max) {
      msg = n == max ? "Continue" : "Select ${max - n} more";
    }
    notifyListeners();
  }
}
