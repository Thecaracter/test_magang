import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_magang/onBoarding/onBoarding1.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => onBoarding1(),
        ),
      );
    });
  }

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Color(0xffFF6584),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 200),
            // child: Image.asset(
            //   "assets/Splash.png",
            //   width: MediaQuery.of(context).size.width / 1,
            //   height: MediaQuery.of(context).size.height / 2,
            // ),
            child: Text(
              "App Bumil",
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
