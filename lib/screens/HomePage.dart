import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restmeal/screens/KiddiesPack.dart';

class HomePAge extends StatefulWidget {
  @override
  _HomePAgeState createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePAge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      drawer: Drawer(
          child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text("Bello Saidu Isah"),
              accountEmail: Text("saeedbello12@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              )),
          ListTile(
            title: Text("Reservations"),
            trailing: Icon(FontAwesomeIcons.fileInvoice,color:  Color(0xFFAA0114),),
          ),
          Divider(),
          ListTile(
            title: Text("Orders"),
            trailing: Icon(FontAwesomeIcons.firstOrder),
          ),
          Divider()
        ],
      )),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFF0F0F0),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
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
                        "assets/images/dinner.png",
                        scale: 5.0,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Dinner")
                    ],
                  ),
                ), //`Text` to display
                onPressed: () {
                 
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

            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            //`Icon` to display
            child: Text(
              'Reserve Table',
              style: TextStyle(color: Colors.white),
            ), //`Text` to display
            onPressed: () {
            
            },
          ),
          Row(
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
                label: Text('Special Order'), //`Text` to display
                onPressed: () {
                  //Code to execute when Floating Action Button is clicked
                  //...
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
                  FontAwesomeIcons.directions,
                  color: Colors.black,
                ), //`Icon` to display
                label: Text('Occassions'), //`Text` to display
                onPressed: () {
                  //Code to execute when Floating Action Button is clicked
                  //...
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
