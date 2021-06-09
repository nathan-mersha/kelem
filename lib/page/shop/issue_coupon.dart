import 'package:flutter/material.dart';
import 'package:kelemapp/api/flutterfire.dart';
import 'package:kelemapp/model/commerce/coupon.dart';
import 'package:kelemapp/widget/icon/icons.dart';
import 'package:kelemapp/widget/info/message.dart';
import 'package:kelemapp/widget/nav/menu.dart';
import 'package:uuid/uuid.dart';

import '../../model/profile/shop.dart';
import '../../rsr/theme/color.dart';

class IssueCouponPage extends StatefulWidget {
  @override
  _IssueCouponPageState createState() => _IssueCouponPageState();
}

class _IssueCouponPageState extends State<IssueCouponPage> {
  TextEditingController couponName;

  TextEditingController couponMuch;

  TextEditingController couponExpirationDate;

  TextEditingController couponDescription;

  TextEditingController couponDiscountType;

  TextEditingController couponValue;
  DateTime dateData;

  GlobalKey<FormState> _globalIssueFormStateKey = GlobalKey<FormState>();
  bool absorbing = false;
  var uuid = Uuid();

  @override
  void initState() {
    // TODO: implement initState
    couponName = TextEditingController();
    couponMuch = TextEditingController();
    couponExpirationDate = TextEditingController();
    couponDescription = TextEditingController();
    couponDiscountType = TextEditingController();
    couponValue = TextEditingController();
    super.initState();
  }

  String formatterDate(DateTime dateTime) {
    return "${dateTime.year}-${dateTime.month}-${dateTime.day}";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    couponName.dispose();
    couponMuch.dispose();
    couponExpirationDate.dispose();
    couponDescription.dispose();
    couponDiscountType.dispose();
    couponValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Shop shop = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: Menu.getAppBar(context, "Issue coupon page"),
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
                      child: ListView(
                        primary: false,
                        shrinkWrap: true,
                        children: [
                          Text(
                            "Issue Coupon",
                            textScaleFactor: 1.2,
                            style: TextStyle(
                                color: CustomColor.GRAY_DARK, fontSize: 20),
                          ),
                          Text(
                            "Issue Coupon to attract more loyality",
                            textScaleFactor: 1.2,
                            style: TextStyle(
                              color: CustomColor.GRAY_LIGHT,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Form(
                            key: _globalIssueFormStateKey,
                            child: ListView(
                              shrinkWrap: true,
                              primary: false,
                              children: [
                                TextFormField(
                                  controller: couponName,
                                  decoration:
                                      InputDecoration(labelText: "name"),
                                  validator: (value) {
                                    if (value == "") {
                                      return "couponName cant be empty";
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: couponMuch,
                                  decoration: InputDecoration(
                                      labelText:
                                          "how much would you like to issue"),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == "") {
                                      return "couponMuch cant be empty";
                                    }
                                    return null;
                                  },
                                ),
                                InkWell(
                                  onTap: () async {
                                    final date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100));
                                    dateData = date;
                                    couponExpirationDate.text =
                                        formatterDate(date);
                                  },
                                  child: IgnorePointer(
                                    child: TextFormField(
                                      controller: couponExpirationDate,
                                      decoration: InputDecoration(
                                          labelText: "expiration date"),
                                      validator: (value) {
                                        if (value == "") {
                                          return "couponExpirationDate cant be empty";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: couponDescription,
                                  decoration:
                                      InputDecoration(labelText: "description"),
                                  validator: (value) {
                                    if (value == "") {
                                      return "couponDescription cant be empty";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.info_outline,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text("discount"),
                                  ],
                                ),
                                TextFormField(
                                  controller: couponDiscountType,
                                  decoration: InputDecoration(
                                      labelText: "discount type"),
                                  validator: (value) {
                                    if (value == "") {
                                      return "couponDiscountType cant be empty";
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: couponValue,
                                  decoration:
                                      InputDecoration(labelText: "value"),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == "") {
                                      return "couponValue cant be empty";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                ElevatedButton(
                                  child: Text("issue coupon"),
                                  onPressed: () async {
                                    if (_globalIssueFormStateKey.currentState
                                        .validate()) {
                                      setState(() {
                                        absorbing = true;
                                      });
                                      Coupon coupon = Coupon(
                                        name: couponName.text,
                                        description: couponDescription.text,
                                        discountType: couponDiscountType.text,
                                        expirationDate: dateData,
                                        discountValue:
                                            num.parse(couponValue.text),
                                        quantity: num.parse(couponMuch.text),
                                        shop: shop,
                                        couponId: uuid.v1(),
                                      );

                                      final result = await addCoupon(coupon);
                                      absorbing = false;
                                      if (result) {
                                        print("good");
                                        couponName.text = "";
                                        couponDescription.text = "";
                                        couponDiscountType.text = "";
                                        couponExpirationDate.text = "";
                                        couponValue.text = "";
                                        couponMuch.text = "";
                                      } else {
                                        print("bad");
                                      }
                                      setState(() {});
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                            "Once have issued a coupon you are obligeted to hold on your promise, in both physical and virtual transaction")),
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
              child: Expanded(
                child: Center(
                  child: Message(
                    icon: CustomIcons.getHorizontalLoading(),
                    message: "loading",
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
