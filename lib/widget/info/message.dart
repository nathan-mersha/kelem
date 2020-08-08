import 'package:flutter/material.dart';
import 'package:kelemapp/rsr/theme/color.dart';

class Message extends StatelessWidget {
  final Function onRetry;
  final Widget icon;
  final String message;

  Message({this.icon, @required this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon == null
              ? Container()
              : icon,
          SizedBox(
            height: 14,
          ),
          message == null
              ? Container()
              : Text(
            message,
            style: TextStyle(color: Color(ColorCustom.GRAY)),
          ),
          SizedBox(
            height: 25,
          ),
          onRetry == null
              ? Container()
              : RaisedButton(
            child: Text(
              "retry",
            ),
            onPressed: () {
              onRetry();
            },
          )
        ],
      ),
    );
  }
}
