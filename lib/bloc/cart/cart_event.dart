part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CardAddItem extends CartEvent {
  final List<Product> cartItem;
  CardAddItem({this.cartItem});
  @override
  // TODO: implement props
  List<Object> get props => [cartItem];
}
