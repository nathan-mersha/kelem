import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  final String query;
  final Function onComplete;

  SearchView({this.query, this.onComplete});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchState();
  }
}

class SearchState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.only(
            left: 15,
          ),
          hintText: "search",
        ),
        maxLines: 1,
        autocorrect: true,
      ),
    );
  }
}
