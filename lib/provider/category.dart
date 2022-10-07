import 'package:flutter/cupertino.dart';

class Category extends ChangeNotifier {
  final List<String> _list = [
    "🌍 World",
    "🐶 Animal",
    "🎓 Education",
    "🏀 Sport",
    "🎮 Games",
    "🌲 Plant",
    "🌴 Vacation",
    "🧥 Fashion",
    "🍔 Food",
    "🎬 Movie",
    "💻 Tech",
    "🎶 Music"
  ];

  List<String> get getCategoryList => _list;

  final List<int> _select = [];

  List<int> get selectedItem => _select;

  void itemSelected(int index) {
    _select.add(index);
    notifyListeners();
  }

  void removeSelected(int index) {
    _select.remove(index);
    notifyListeners();
  }

  final int max = 4;
}
