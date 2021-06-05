import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelemapp/bloc/cart/cart_bloc.dart';
import 'package:kelemapp/rsr/theme/color.dart';
import 'package:kelemapp/widget/nav/menu.dart';
import 'package:kelemapp/widget/product/bottom_sheet_product.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Cart"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        color: CustomColor.GRAY_VERY_LIGHT,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is CartGetItemState) {
                      return ListView.builder(
                          itemCount: state.cartItem.length,
                          itemBuilder: (context, index) {
                            print(
                                "state.cartItem[index] ${state.cartItem[index].quantity}");
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    buildProductViewCart(
                                        state.cartItem[index], context, index),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
