import 'package:flutter/material.dart';
import 'package:kelemapp/db/k_shared_preference.dart';
import 'package:kelemapp/route/route.dart';
import 'package:kelemapp/rsr/theme/color.dart';

class LanguagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LanguagePageState();
  }
}

class _LanguagePageState extends State<LanguagePage> {
  // LocalPreference aSP = GetLocalPreferenceInstance.localPreference;
  HSharedPreference localPreference = GetHSPInstance.hSharedPreference;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                color: CustomColor.GRAY_VERY_LIGHT,
                width: double.infinity,
                child: Image.asset(
                  "assets/images/addisababa_silhouet.png",
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 60),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/icon_primary_color.png",
                      width: 60,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "ሰላም",
                      style: TextStyle(
                          fontSize: 28, color: CustomColor.GRAY_LIGHT),
                    ),
                    Text(
                      "Hello there,",
                      style: TextStyle(fontSize: 28, color: CustomColor.GRAY),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "እባክዎ ቋንቋ ይምረጡ",
                              style: TextStyle(
                                  fontSize: 16, color: CustomColor.GRAY_DARK),
                            ),
                            Text(
                              "please select a language",
                              style: TextStyle(
                                  fontSize: 16, color: CustomColor.GRAY),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            DropdownButton<String>(
                              isExpanded: true,
                              hint: Text(
                                "please select language",
                              ),
                              onChanged: (studentId) {
                                // on package change
                              },
                              value: "english",
                              items:
                                  ["english", "amharic"].map((String package) {
                                return DropdownMenuItem<String>(
                                    value: package, child: Text(package));
                              }).toList(),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.deepOrangeAccent,
                                ),
                                child: Text(
                                  "proceed",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async {
                                  // todo : set first time flag to false
                                  // todo : navigate to welcome page
                                  await localPreference.set(
                                      HSharedPreference.KEY_FIRST_TIME, true);
                                  Navigator.pushReplacementNamed(
                                      context, RouteTo.HOME);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
