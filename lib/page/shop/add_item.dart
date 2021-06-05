import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kelemapp/widget/nav/menu.dart';

class AddItemPage extends StatefulWidget {
  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  File imageFile;
  List<Map<String, dynamic>> metaData = [
    {"key": "ert", "value": "sa"},
    {"key": "ert21", "value": "sa23"},
  ];
  TextEditingController valueController = TextEditingController();
  TextEditingController keyController = TextEditingController();
  GlobalKey<FormState> _globalFormStateKey = GlobalKey<FormState>();
  final picker = ImagePicker();
  chooseImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      imageFile = File(pickedFile.path);
    });
  }

  @override
  void dispose() {
    valueController.dispose();
    keyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Add Item"),
      drawer: Menu.getSideDrawer(context),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 10),
            child: Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            chooseImage(ImageSource.camera);
                                            Navigator.pop(context);
                                          },
                                          child: Text("Camera")),
                                      ElevatedButton(
                                          onPressed: () {
                                            chooseImage(ImageSource.gallery);
                                            Navigator.pop(context);
                                          },
                                          child: Text("Galley")),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Container(
                        height: 150,
                        width: 100,
                        child: imageFile != null
                            ? Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(imageFile),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Container(
                                height: 150,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                ),
                                child: Icon(
                                  Icons.camera,
                                  size: 50,
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Form(
                      child: ListView(
                        shrinkWrap: true,
                        primary: false,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(labelText: "category"),
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: "sub category"),
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: "name"),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "author/manufacture"),
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: "price"),
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: "available stock"),
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: "tag"),
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: "description"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("meta-data"),
                          SizedBox(
                            height: 10,
                          ),
                          Form(
                            key: _globalFormStateKey,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: keyController,
                                          validator: (value) {
                                            if (value == "") {
                                              return "key cant be empty";
                                            }
                                            return null;
                                          },
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(bottom: 10),
                                            hintText: "key",
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: valueController,
                                          validator: (value) {
                                            if (value == "") {
                                              return "value cant be empty";
                                            }
                                            return null;
                                          },
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(bottom: 10),
                                            hintText: "value",
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          if (_globalFormStateKey.currentState
                                              .validate()) {
                                            Map<String, String> data = {
                                              "key": keyController.text,
                                              "value": valueController.text
                                            };
                                            metaData.add(data);
                                            valueController.text = "";
                                            keyController.text = "";
                                            FocusScope.of(context).unfocus();
                                            setState(() {});
                                          }
                                        },
                                        child: Icon(Icons.add)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: metaData.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                              child: Text(
                                                  metaData[index]["value"])),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                              child: Text(
                                                  metaData[index]["value"])),
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            int dataCode = index;
                                            print("index $dataCode $metaData");
                                            metaData.removeAt(dataCode);
                                            print("index $dataCode $metaData");

                                            setState(() {});
                                          },
                                          child: Icon(Icons.remove)),
                                    ],
                                  ),
                                );
                              }),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  child: Text("update"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Theme.of(context).accentColor,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Theme.of(context).primaryColor,
                                  ),
                                  child: Text("delete"),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
