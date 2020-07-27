import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kelemapp/rsr/theme/color.dart';

class Loading extends StatelessWidget {
  final String message;
  Loading({this.message = "loading"});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SpinKitFadingFour(
            color: Color(ColorCustom.GRAY),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            message,
            style: TextStyle(color: Color(ColorCustom.GRAY_LIGHT)),
          )
        ],
      ),
    );
  }
}
