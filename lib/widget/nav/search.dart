import 'package:flutter/material.dart';
import 'package:kelemapp/api/kelemApi.dart';

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
  TextEditingController searchController;
  String search;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController=TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: TextFormField(
        controller: searchController..text=search,
        textAlignVertical: TextAlignVertical.center,
        onChanged: (searchValue) {
            search = searchValue;
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: GestureDetector(
              onTap: (){
                print("here here $search");

                widget.onComplete(search);
              },
              child: Icon(Icons.search)),
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
