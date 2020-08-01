import 'package:flutter/material.dart';
import 'package:kelemapp/model/config/global.dart';

class LocalConfig with ChangeNotifier {
  Category _selectedCategory;
  String _selectedSubCategory;

  Category get selectedCategory => _selectedCategory;

  set selectedCategory(Category value) {
    _selectedCategory = value;
    notifyListeners();
  }

  String get selectedSubCategory => _selectedSubCategory;

  set selectedSubCategory(String value) {
    _selectedSubCategory = value;
    notifyListeners();
  }

  LocalConfig();
}
