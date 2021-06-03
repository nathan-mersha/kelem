part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CardGetItemEvent extends CartEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CardAddItem extends CartEvent {
  final Product cartItem;
  CardAddItem({this.cartItem});
  @override
  // TODO: implement props
  List<Object> get props => [cartItem];
}

class CardRemoveItem extends CartEvent {
  final Product cartItem;
  CardRemoveItem({this.cartItem});
  @override
  // TODO: implement props
  List<Object> get props => [cartItem];
}
