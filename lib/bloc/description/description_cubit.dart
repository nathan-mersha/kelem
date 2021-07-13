import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'description_state.dart';

class DescriptionCubit extends Cubit<DescriptionState> {
  bool showDescription = false;
  DescriptionCubit() : super(DescriptionInitial(showDescription: false));

  void emitDescription() {
    showDescription = !showDescription;
    emit(DescriptionInitial(showDescription: showDescription));
  }
}
