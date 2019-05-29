import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restmeal/screens/Breakfast.dart';
import 'package:restmeal/screens/Dinner.dart';
import 'package:restmeal/screens/KiddiesPack.dart';
import 'package:restmeal/screens/Lunch.dart';
import 'package:restmeal/screens/MenuListings.dart';
import 'package:restmeal/screens/Party.dart';
import 'package:restmeal/screens/ReserveTable.dart';
import 'tools/CustomShapeClipper.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final Widget restLogo = new SvgPicture.asset(
  'assets/images/logo.svg',
  color: Colors.white,
  height: 80,
);

class RootScreen extends StatefulWidget {
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xFFF0F0F0),
        body: ListView(
          
          children: <Widget>[
            Stack(
            children: <Widget>[
              TopScreen(),
              
              Padding(
                padding: const EdgeInsets.only(top:175.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.white,

                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          //`Icon` to display
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/images/breakfast.png",
                                  scale: 2.6,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Breakfast")
                              ],
                            ),
                          ), //`Text` to display
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>BreakFast()));
                          },
                        ),
                        FlatButton(
                          color: Colors.white,

                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          //`Icon` to display
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/images/kiddies.png",
                                  scale: 5.0,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Kiddies Pack")
                              ],
                            ),
                          ), //`Text` to display
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>KiddiesPackage()));
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.white,

                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          //`Icon` to display
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/images/snack.png",
                                  scale: 5.0,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Lunch")
                              ],
                            ),
                          ), //`Text` to display
                          onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>Lunch()));
                          },
                        ),
                        FlatButton(
                          color: Colors.white,

                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          //`Icon` to display
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/images/drinks.png",
                                  scale: 10.0,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Drinks")
                              ],
                            ),
                          ), //`Text` to display
                          onPressed: () {
                             Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>Dinner()));
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    FlatButton(
                      padding: EdgeInsets.symmetric(horizontal: 110.0),
                      color: Colors.red,

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      //`Icon` to display
                      child: Text(
                        'Reserve Table',
                        style: TextStyle(color: Colors.white),
                      ), //`Text` to display
                      onPressed: () {
                         Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => LoadTable()));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom:20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      
                        children: <Widget>[
                          FlatButton.icon(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            icon: Icon(
                              FontAwesomeIcons.table,
                              color: Color(0xFF3b5998),
                            ), //`Icon` to display
                            label: Text('Menu Listing'), //`Text` to display
                            onPressed: () {
                             Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>MenuListing()));
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FlatButton.icon(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            icon: Icon(
                              FontAwesomeIcons.shoppingBasket,
                              color: Colors.redAccent,
                            ), 
                            //`Icon` to display
                            label: Text('Party'), //`Text` to display
                            onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>PartyTable()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ],
        ));
  }
}

class TopScreen extends StatefulWidget {
  @override
  _TopScreenState createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 280.0,
            width: double.infinity,
            color:  Color(0xFFAA0114),
            child: Center(
              child: restLogo,
            ),
          ),
        )
      ],
    );
  }
}
