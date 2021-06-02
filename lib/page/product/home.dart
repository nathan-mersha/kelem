import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelemapp/bloc/down/down_bloc.dart';
import 'package:kelemapp/rsr/theme/main_theme.dart';
import 'package:kelemapp/widget/nav/menu.dart';
import 'package:kelemapp/widget/nav/products_nav.dart';
import 'package:kelemapp/widget/product/bottom_sheet_product.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: Menu.getAppBar(context, "Home", showCategory: true),
      drawer: Menu.getSideDrawer(context),
      backgroundColor: Theme.of(context).backgroundColor,
      body: BlocListener<DownBloc, DownState>(
        listener: (context, state) {
          // TODO: implement listener}
          if (state is DownSelected) {
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     content: Text('A SnackBar!'),
            //     duration: Duration(milliseconds: 300),
            //   ),
            // );

            Scaffold.of(context).showBottomSheet(
              (context) {
                return WillPopScope(
                  onWillPop: () {
                    BlocProvider.of<DownBloc>(context)
                        .add(DownUnSelectedEvent());
                    return Future.value(true);
                  },
                  child: Container(
                    height: 300,
                    child: buildProductViewSectionBottomSheet(
                        state.product, context),
                  ),
                );
              },
              elevation: 3,
            );
          }
        },
        child: Padding(
          padding: MainTheme.getPagePadding(),
          child: ProductNavigation(),
        ),
      ),
    );
  }
}
