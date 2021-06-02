import 'package:auto_size_text/auto_size_text.dart';
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
          icon == null ? Container() : icon,
          SizedBox(
            height: 14,
          ),
          message == null
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: AutoSizeText(
                    message,
                    style: TextStyle(color: CustomColor.GRAY),
                    maxLines: 3,
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.justify,
                  ),
                ),
          SizedBox(
            height: 25,
          ),
          onRetry == null
              ? Container()
              : ElevatedButton(
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
