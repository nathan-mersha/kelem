import 'package:flutter/material.dart';
import 'package:kelemapp/route/route.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WelcomePageState();
  }
}

class _WelcomePageState extends State<WelcomePage> {
  static final welcomePage = [
    // First welcome page
    {
      "title": "Search and Locate",
      "description": "Search and locate from a variety of items including but not limited to books, medicine and iot devices.",
      "image": "assets/images/welcome/screen1.png"
    },

    // Second welcome page
    {
      "title": "Add to Wish list",
      "description": "If you cold not find what you are looking for then add it to your wish list, we will notify supliers.",
      "image": "assets/images/welcome/screen2.png"
    },

    // Third welcome page
    {
      "title": "Enjoy the community",
      "description": "Awra market is a big community of retailers and suppliers, participate in the communtiy, and have fun!",
      "image": "assets/images/welcome/screen3.png"
    },
  ];

  int currentPage = 0;
  PageController controller;

  @override
  Widget build(BuildContext context) {
    controller = PageController(initialPage: 0);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child:

            PageView(
              controller: controller,
              children: <Widget>[
                getWelcomeScreens(0),
                getWelcomeScreens(1),
                getWelcomeScreens(2),
              ],
              onPageChanged: (pageIndex) {
                setState(() {
                  currentPage = pageIndex;
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: getPositionIndicators(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, RouteTo.PROFILE_SIGN_IN);
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 15, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w800),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, RouteTo.HOME);
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(fontSize: 15, color: Colors.black54, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getPositionIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: CircleAvatar(
              minRadius: 3,
              maxRadius: 3,
              backgroundColor: currentPage == 0 ? Theme.of(context).primaryColor : Colors.black54,
            )),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: CircleAvatar(
              minRadius: 3,
              maxRadius: 3,
              backgroundColor: currentPage == 1 ? Theme.of(context).primaryColor : Colors.black54,
            )),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: CircleAvatar(
              minRadius: 3,
              maxRadius: 3,
              backgroundColor: currentPage == 2 ? Theme.of(context).primaryColor : Colors.black54,
            )),
      ],
    );
  }

  Widget getWelcomeScreens(int index) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 12),
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Image.asset(
          welcomePage[index]["image"],
          height: 300,
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(
                welcomePage[index]["title"],
                maxLines: 4,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 19),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 35, horizontal: 95),
                child: Text(
                  welcomePage[index]["description"],
                  maxLines: 4,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              )
            ],
          ),
        ),
      ])),
    );
  }
}
