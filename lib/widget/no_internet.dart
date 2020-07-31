import 'package:flutter/material.dart';
import 'package:kelemapp/rsr/theme/color.dart';

class NoInternet extends StatelessWidget {
  final Function onRetry;
  NoInternet({this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.cloud_off,
            color: Color(ColorCustom.GRAY_LIGHT),
            size: 60,
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            "no internet",
            style: TextStyle(color: Color(ColorCustom.GRAY)),
          ),
          SizedBox(
            height: 25,
          ),
          onRetry != null
              ? RaisedButton(
                  child: Text(
                    "retry",
                  ),
                  onPressed: () {
                    onRetry();
                  },
                )
              : Container()
        ],
      ),
    );
  }
}
