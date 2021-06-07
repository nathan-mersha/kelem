import 'package:flutter/material.dart';
import 'package:kelemapp/model/config/global.dart';

class LocalConfig with ChangeNotifier {
  Category _selectedCategory;
  String _selectedSubCategory;
  String _selectedsearchBook;

  Category get selectedCategory => _selectedCategory;

  set selectedCategory(Category value) {
    _selectedCategory = value;
    print("this is good");
    notifyListeners();
  }

  String get selectedSubCategory => _selectedSubCategory;

  set selectedSubCategory(String value) {
    _selectedSubCategory = value;
    notifyListeners();
  }

  String get selectedSearchBook => _selectedsearchBook;

  set selectedSearchBook(String value) {
    _selectedsearchBook = value;
    notifyListeners();
  }

  LocalConfig();
}
