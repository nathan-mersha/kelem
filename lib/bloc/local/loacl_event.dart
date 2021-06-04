part of 'loacl_bloc.dart';

abstract class LoaclEvent extends Equatable {
  const LoaclEvent();
}
class LocalBEventSet extends LoaclEvent{
  Category selectedCategory;
  String selectedSubCategory;
  String selectedsearchBook;
  LocalBEventSet({this.selectedCategory, this.selectedSubCategory, this.selectedsearchBook});
  @override
  // TODO: implement props
  List<Object> get props => [selectedCategory,selectedSubCategory,selectedsearchBook];
}