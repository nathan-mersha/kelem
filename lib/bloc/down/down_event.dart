part of 'down_bloc.dart';

@immutable
abstract class DownEvent extends Equatable {
  const DownEvent();
}

class DownSelectedEvent extends DownEvent {
  final Product product;
  final BuildContext context;
  DownSelectedEvent({this.product, this.context});
  @override
  // TODO: implement props
  List<Object> get props => [product];
}

class DownUnSelectedEvent extends DownEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
