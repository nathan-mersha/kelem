import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kelemapp/api/flutterfire.dart';
import 'package:kelemapp/model/profile/shop.dart';
import 'package:kelemapp/route/route.dart';
import 'package:kelemapp/widget/icon/icons.dart';
import 'package:kelemapp/widget/info/message.dart';
import 'package:kelemapp/widget/nav/menu.dart';
import 'package:path/path.dart';

class EditShopPage extends StatefulWidget {
  final bundle;
  EditShopPage({this.bundle});
  @override
  _EditShopPageState createState() => _EditShopPageState();
}

class _EditShopPageState extends State<EditShopPage> {
  File imageFile;

  GlobalKey<FormState> _globalAllFormStateKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController tinController = TextEditingController();
  TextEditingController primaryPhoneController = TextEditingController();
  TextEditingController secondaryPhoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController physicalAddressController = TextEditingController();
  bool absorbing = false;
  bool allSeen = false;
  bool imageSelected = false;
  String docId;
  final picker = ImagePicker();

  chooseImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      imageSelected = true;
      imageFile = File(pickedFile.path);
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    tinController.dispose();
    primaryPhoneController.dispose();
    secondaryPhoneController.dispose();
    emailController.dispose();
    websiteController.dispose();
    physicalAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Shop shop = ModalRoute.of(context).settings.arguments;
    if (shop != null && !allSeen) {
      imageFile = File(shop.logo);
      nameController.text = shop.name;
      tinController.text = shop.shopId;
      primaryPhoneController.text = shop.primaryPhone;
      secondaryPhoneController.text = shop.secondaryPhone;
      emailController.text = shop.email;
      websiteController.text = shop.website;
      physicalAddressController.text = shop.physicalAddress;
      allSeen = true;
      setState(() {});
    }
    return Scaffold(
      appBar: Menu.getAppBar(context, "Edit shop page"),
      drawer: Menu.getSideDrawer(context),
      body: WillPopScope(
        onWillPop: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, RouteTo.SHOP_ADMIN);
          return Future.value(true);
        },
        child: AbsorbPointer(
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
                                    ? allSeen && !imageSelected
                                        ? CircleAvatar(
                                            radius: 50,
                                            backgroundColor: Colors.white,
                                            child: CachedNetworkImage(
                                              imageUrl: shop.logo,
                                              fit: BoxFit.cover,
                                              useOldImageOnUrlChange: false,
                                              placeholderFadeInDuration:
                                                  Duration(seconds: 1),
                                              placeholder:
                                                  (BuildContext context,
                                                      String imageURL) {
                                                return CircleAvatar(
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .primaryColor,
                                                  radius: 50,
                                                  child: Text(
                                                    "${shop.name.substring(0, 1).toUpperCase()}",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 40,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        : Container(
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
                                        InputDecoration(labelText: "name"),
                                    controller: nameController,
                                    validator: (value) {
                                      if (value == "") {
                                        return "name cant be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    controller: tinController,
                                    decoration:
                                        InputDecoration(labelText: "tin"),
                                    keyboardType: TextInputType.number,
                                    maxLength: 11,
                                    validator: (value) {
                                      if (value == "") {
                                        return "tin cant be empty";
                                      } else if (value.length != 11) {
                                        return "tin must be 11 digit long";
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    controller: primaryPhoneController,
                                    decoration: InputDecoration(
                                        labelText: "primary phone"),
                                    keyboardType: TextInputType.phone,
                                    validator: (value) {
                                      if (value == "") {
                                        return "primary phone cant be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText: "secondary phone"),
                                    controller: secondaryPhoneController,
                                    keyboardType: TextInputType.phone,
                                    validator: (value) {
                                      if (value == "") {
                                        return "secondary phone cant be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    decoration:
                                        InputDecoration(labelText: "email"),
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == "") {
                                        return "email cant be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    decoration:
                                        InputDecoration(labelText: "website"),
                                    controller: websiteController,
                                    keyboardType: TextInputType.url,
                                    validator: (value) {
                                      if (value == "") {
                                        return "website cant be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText: "physical address"),
                                    keyboardType: TextInputType.streetAddress,
                                    controller: physicalAddressController,
                                    validator: (value) {
                                      if (value == "") {
                                        return "physical address cant be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text("pin on map"),
                                  SizedBox(
                                    height: 10,
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
                                              final urlImage =
                                                  await uploadFile();
                                              if (urlImage == null &&
                                                  imageFile != null) {
                                                return;
                                              }
                                              Shop shop = Shop(
                                                name: nameController.text,
                                                shopId: tinController.text,
                                                logo: urlImage,
                                                category: "book",
                                                primaryPhone:
                                                    primaryPhoneController.text,
                                                secondaryPhone:
                                                    secondaryPhoneController
                                                        .text,
                                                coOrdinates: ["0", "0"],
                                                email: emailController.text,
                                                website: websiteController.text,
                                                physicalAddress:
                                                    physicalAddressController
                                                        .text,
                                                isVerified: false,
                                                isVirtual: false,
                                              );
                                              // todo edit or add product
                                              if (true) {
                                                shop.firstModified =
                                                    DateTime.now();
                                                shop.lastModified =
                                                    DateTime.now();
                                              } else {
                                                shop.lastModified =
                                                    DateTime.now();
                                              }

                                              final result =
                                                  await addShop(shop);
                                              absorbing = false;
                                              if (result) {
                                                print("good");
                                                nameController.text = "";
                                                tinController.text = "";
                                                primaryPhoneController.text =
                                                    "";
                                                secondaryPhoneController.text =
                                                    "";
                                                emailController.text = "";
                                                websiteController.text = "";
                                                physicalAddressController.text =
                                                    "";

                                                imageFile = null;

                                                FocusScope.of(context)
                                                    .unfocus();
                                                Navigator.pop(context);
                                                Navigator.pushNamed(context,
                                                    RouteTo.SHOP_ADMIN);
                                              } else {
                                                print("bad");
                                              }
                                              setState(() {});
                                            }
                                          },
                                        ),
                                      ),
                                      // SizedBox(
                                      //   width: 10,
                                      // ),
                                      // Expanded(
                                      //   child: ElevatedButton(
                                      //     style: ElevatedButton.styleFrom(
                                      //       primary:
                                      //           Theme.of(context).primaryColor,
                                      //     ),
                                      //     child: Text("delete"),
                                      //     onPressed: () {},
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   width: 30,
                                      // ),
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
      ),
    );
  }

  Future<String> uploadFile() async {
    if (imageFile == null) return null;
    final fileName = basename(imageFile.path);
    final String destination = 'shops/$fileName';
    UploadTask task = uploadFileStore(destination, imageFile);
    if (task == null) return null;
    final snapshot = await task.whenComplete(() => null);
    final urlDownload = await snapshot.ref.getDownloadURL();
    print("urlDownload $urlDownload");
    return urlDownload;
  }
}
