import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kelemapp/model/config/global.dart';
import 'package:kelemapp/model/config/local.dart';

part 'loacl_event.dart';
part 'loacl_state.dart';

class LoaclBloc extends Bloc<LoaclEvent, LoaclState> {
  LoaclBloc() : super(LoaclInitial());

  @override
  Stream<LoaclState> mapEventToState(
    LoaclEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if(event is LocalBEventSet){
      yield LoaclBState(selectedCategory: event.selectedCategory,selectedSubCategory:event.selectedSubCategory,selectedsearchBook: event.selectedsearchBook);

    }
  }
}
