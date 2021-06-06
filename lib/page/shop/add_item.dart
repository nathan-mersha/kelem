import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kelemapp/api/flutterfire.dart';
import 'package:kelemapp/model/commerce/product.dart';
import 'package:kelemapp/model/profile/shop.dart';
import 'package:kelemapp/widget/icon/icons.dart';
import 'package:kelemapp/widget/info/message.dart';
import 'package:kelemapp/widget/nav/menu.dart';
import 'package:material_tag_editor/tag_editor.dart';
import 'package:path/path.dart';

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

  GlobalKey<FormState> _globalAllFormStateKey = GlobalKey<FormState>();
  TextEditingController categoryController = TextEditingController();
  TextEditingController subcategoryController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController availableController = TextEditingController();
  TextEditingController tagController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool absorbing = false;
  List<String> tagList = [];
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
    final Shop shop = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: Menu.getAppBar(context, "Add Item"),
      drawer: Menu.getSideDrawer(context),
      body: AbsorbPointer(
        absorbing: absorbing,
        child: Stack(
          children: [
            ListView(
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
                                                  chooseImage(
                                                      ImageSource.camera);
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Camera")),
                                            ElevatedButton(
                                                onPressed: () {
                                                  chooseImage(
                                                      ImageSource.gallery);
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
                            key: _globalAllFormStateKey,
                            child: ListView(
                              shrinkWrap: true,
                              primary: false,
                              children: [
                                TextFormField(
                                  decoration:
                                      InputDecoration(labelText: "category"),
                                  controller: categoryController,
                                  validator: (value) {
                                    if (value == "") {
                                      return "category cant be empty";
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: subcategoryController,
                                  decoration: InputDecoration(
                                      labelText: "sub category"),
                                  validator: (value) {
                                    if (value == "") {
                                      return "subcategory cant be empty";
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: nameController,
                                  decoration:
                                      InputDecoration(labelText: "name"),
                                  validator: (value) {
                                    if (value == "") {
                                      return "name cant be empty";
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      labelText: "author/manufacture"),
                                  controller: authorController,
                                  validator: (value) {
                                    if (value == "") {
                                      return "author cant be empty";
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  decoration:
                                      InputDecoration(labelText: "price"),
                                  controller: priceController,
                                  validator: (value) {
                                    if (value == "") {
                                      return "price cant be empty";
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      labelText: "available stock"),
                                  controller: availableController,
                                  validator: (value) {
                                    if (value == "") {
                                      return "stack cant be empty";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TagEditor(
                                  length: tagList.length,
                                  delimiters: [',', ' '],
                                  hasAddButton: true,
                                  inputDecoration: const InputDecoration(
                                    hintText: "tag",
                                  ),
                                  onTagChanged: (value) {
                                    tagList.add(value);
                                    setState(() {});
                                  },
                                  tagBuilder: (context, index) {
                                    return _Chip(
                                      index: index,
                                      label: tagList[index],
                                      onDeleted: onDelete,
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  decoration:
                                      InputDecoration(labelText: "description"),
                                  controller: descriptionController,
                                  validator: (value) {
                                    if (value == "") {
                                      return "description cant be empty";
                                    }
                                    return null;
                                  },
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
                                                      EdgeInsets.only(
                                                          bottom: 10),
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
                                                      EdgeInsets.only(
                                                          bottom: 10),
                                                  hintText: "value",
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                if (_globalFormStateKey
                                                    .currentState
                                                    .validate()) {
                                                  Map<String, String> data = {
                                                    "key": keyController.text,
                                                    "value":
                                                        valueController.text
                                                  };
                                                  metaData.add(data);
                                                  valueController.text = "";
                                                  keyController.text = "";
                                                  FocusScope.of(context)
                                                      .unfocus();
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
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                    child: Text(metaData[index]
                                                        ["value"])),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                    child: Text(metaData[index]
                                                        ["value"])),
                                              ),
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  int dataCode = index;
                                                  print(
                                                      "index $dataCode $metaData");
                                                  metaData.removeAt(dataCode);
                                                  print(
                                                      "index $dataCode $metaData");

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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        child: Text("update"),
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Theme.of(context).accentColor,
                                        ),
                                        onPressed: () async {
                                          if (_globalAllFormStateKey
                                              .currentState
                                              .validate()) {
                                            setState(() {
                                              absorbing = true;
                                            });
                                            final urlImage = await uploadFile();
                                            if (urlImage == null &&
                                                imageFile != null) {
                                              return;
                                            }
                                            Product product = Product(
                                              shop: shop,
                                              image: urlImage,
                                              name: nameController.text,
                                              price: num.parse(
                                                  priceController.text),
                                              description:
                                                  descriptionController.text,
                                              category: categoryController.text,
                                              subCategory:
                                                  subcategoryController.text,
                                              availableStock: num.parse(
                                                  availableController.text),
                                              authorOrManufacturer:
                                                  authorController.text,
                                              tag: tagList,
                                              metaData: metaData,
                                            );
                                            // todo edit or add product
                                            if (true) {
                                              product.firstModified =
                                                  DateTime.now();
                                            } else {
                                              product.lastModified =
                                                  DateTime.now();
                                            }

                                            final result =
                                                await addProduct(product);
                                            absorbing = false;
                                            if (result) {
                                              print("good");
                                              nameController.text = "";
                                              priceController.text = "";
                                              descriptionController.text = "";
                                              categoryController.text = "";
                                              subcategoryController.text = "";
                                              availableController.text = "";
                                              authorController.text = "";
                                              tagList = [];
                                              metaData = [];
                                              imageFile = null;
                                            } else {
                                              print("bad");
                                            }
                                            setState(() {});
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Theme.of(context).primaryColor,
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
            Visibility(
              visible: absorbing,
              child: Center(
                child: Message(
                  icon: CustomIcons.getHorizontalLoading(),
                  message: "loading",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<String> uploadFile() async {
    if (imageFile == null) return null;
    final fileName = basename(imageFile.path);
    final String destination = 'files/$fileName';
    UploadTask task = uploadFileStore(destination, imageFile);
    if (task == null) return null;
    final snapshot = await task.whenComplete(() => null);
    final urlDownload = await snapshot.ref.getDownloadURL();
    print("urlDownload $urlDownload");
    return urlDownload;
  }

  void onDelete(int index) {
    tagList.removeAt(index);
    setState(() {});
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    @required this.label,
    @required this.onDeleted,
    @required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      deleteIcon: Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
