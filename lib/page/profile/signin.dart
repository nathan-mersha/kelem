import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:kelemapp/rsr/theme/color.dart';

class SignInPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInPageState();
  }
}

class _SignInPageState extends State<SignInPage> {
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
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 35),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Sign in",
                      style: TextStyle(fontSize: 28, color: CustomColor.GRAY_LIGHT, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "Let us know you more.",
                      style: TextStyle(color: CustomColor.GRAY),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Form(
                          child: ListView(
//                            itemExtent: 50,
                            children: <Widget>[
                              TextFormField(
                                decoration: InputDecoration(hintText: "email"),
                              ),
// todo : un hide password view if user continues with email.
//                              TextFormField(
//                                decoration:
//                                InputDecoration(hintText: "password"),
//                              ),
                              SizedBox(
                                height: 16,
                              ),
                              SignInButton(
                                Buttons.Email,
                                onPressed: () {},
                              ),
                              SignInButton(
                                Buttons.Google,
                                onPressed: () {
                                  // todo : signin with the prefered method
                                  // todo : navigate to home
//                                  authService
//                                      .signInWithGoogle()
//                                      .then((firebaseUser) {
//                                    Navigator.pushReplacementNamed(
//                                        context, RouteTo.HOME);
//                                  });
                                },
                              ),
                              SignInButton(
                                Buttons.Facebook,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "I will do it later !",
                          style: TextStyle(color: CustomColor.GRAY),
                        ),
                        FlatButton(
                          child: Text(
                            "skip",
                            style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w800, fontSize: 16),
                          ),
                          onPressed: () {
                            // todo : navigate to home
//                            Navigator.pushReplacementNamed(
//                                context, RouteTo.HOME);
                          },
                        )
                      ],
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
