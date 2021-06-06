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
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is CartGetItemState) {
                      return ListView.builder(
                          itemCount: state.cartItem.products.length,
                          itemBuilder: (context, index) {
                            print(
                                "state.cartItem[index] ${state.cartItem.products[index].quantity}");
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    buildProductViewCart(
                                        state.cartItem.products[index],
                                        context,
                                        index),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30, right: 40),
                child: BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is CartGetItemState) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                      "subtotal(${state.cartItem.products.length} items)"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("delivering and handling"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("transaction fee"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("tax"),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text("total"),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                children: [
                                  Text("${state.cartItem.amount.subTotal}.00"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      "${state.cartItem.amount.handlingFee}.00"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      "${state.cartItem.amount.transactionFee}.00"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("${state.cartItem.amount.tax}"),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text("${state.cartItem.amount.total}.00"),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 250,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text("proceed to checkout")),
                          ),
                        ],
                      );
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
