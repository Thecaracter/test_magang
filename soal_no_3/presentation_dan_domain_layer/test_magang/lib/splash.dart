import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_magang/Auth/login.dart';
import 'package:test_magang/Page/home.dart';

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
          builder: (context) => Login(),
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
