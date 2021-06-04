part of 'loacl_bloc.dart';

abstract class LoaclState extends Equatable {
  const LoaclState();
}

class LoaclInitial extends LoaclState {
  @override
  List<Object> get props => [];
}

class LoaclBState extends LoaclState {
  Category selectedCategory;
  String selectedSubCategory;
  String selectedsearchBook;
  LoaclBState(
      {this.selectedCategory,
      this.selectedSubCategory,
      this.selectedsearchBook});
  @override
  // TODO: implement props
  List<Object> get props =>
      [selectedCategory, selectedSubCategory, selectedsearchBook];
}
