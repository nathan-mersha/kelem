part of 'down_bloc.dart';

abstract class DownState extends Equatable {
  const DownState();
}

class DownInitial extends DownState {
  @override
  List<Object> get props => [];
}

class DownSelected extends DownState {
  final Product product;
  DownSelected({this.product});
  @override
  // TODO: implement props
  List<Object> get props => [product];
}
