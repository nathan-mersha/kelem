part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}

class CartAddItemState extends CartState {
  final List<Product> cartItem;
  CartAddItemState({this.cartItem});
  @override
  List<Object> get props => [cartItem];
}
