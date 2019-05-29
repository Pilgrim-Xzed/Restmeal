import "package:flutter/material.dart";
import "package:restmeal/screens/root.dart";
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    new Future.delayed(const Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => RootScreen()));
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAA0114),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: Material(
                elevation: 3.0,
                borderRadius: BorderRadius.circular(100.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset("assets/images/splash.png"),
                ),
              ),
            ),
          
             Image.asset("assets/images/loader.gif",scale: 3.0,),
           
          ],
        ),
      ),
      
    );
  }
}