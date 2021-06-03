import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kelemapp/bloc/cart/store_cart.dart';
import 'package:kelemapp/model/commerce/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  StoreCart _storeCart = StoreCart();
  CartBloc() : super(CartInitial());

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is CardAddItem) {
      yield* _addToCartList(event);
    } else if (event is CardRemoveItem) {
      yield* _removeFromCartList(event);
    } else if (event is CardGetItemEvent) {
      yield* _getCartList(event);
    }
  }

  Stream<CartState> _addToCartList(event) async* {
    yield CartInitial();
    _storeCart.storeCartDetails(event.cartItem);
    yield CartAddItemState();
    List<Product> cartList = _storeCart.retrieveFoodDetails();
    yield CartGetItemState(cartItem: cartList);
  }

  Stream<CartState> _removeFromCartList(event) async* {
    yield CartInitial();
    _storeCart.removeCartDetails(event.cartItem);
    yield CartRemoveItemState();
    List<Product> cartList = _storeCart.retrieveFoodDetails();
    yield CartGetItemState(cartItem: cartList);
  }

  Stream<CartState> _getCartList(event) async* {
    yield CartInitial();
    List<Product> cartList = _storeCart.retrieveFoodDetails();
    yield CartGetItemState(cartItem: cartList);
  }
}
