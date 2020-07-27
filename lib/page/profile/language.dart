import 'package:flutter/material.dart';
import 'package:kelemapp/rsr/theme/color.dart';

class LanguagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LanguagePageState();
  }
}

class _LanguagePageState extends State<LanguagePage> {
//  LocalPreference aSP = GetLocalPreferenceInstance.localPreference;

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
                color: Color(ColorCustom.GRAY_VERY_LIGHT),
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
                      style: TextStyle(fontSize: 28, color: Color(ColorCustom.GRAY_LIGHT)),
                    ),
                    Text(
                      "Hello there,",
                      style: TextStyle(fontSize: 28, color: Color(ColorCustom.GRAY)),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "እባክዎ ቋንቋ ይምረጡ",
                              style: TextStyle(fontSize: 16, color: Color(ColorCustom.GRAY_DARK)),
                            ),
                            Text(
                              "please select a language",
                              style: TextStyle(fontSize: 16, color: Color(ColorCustom.GRAY)),
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
                              items: ["english", "amharic"].map((String package) {
                                return DropdownMenuItem<String>(value: package, child: Text(package));
                              }).toList(),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              width: double.infinity,
                              child: RaisedButton(
                                color: Colors.deepOrangeAccent,
                                child: Text(
                                  "proceed",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  // todo : set first time flag to false
                                  // todo : navigate to welcome page
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
