import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_magang/Auth/login.dart';

class onBoarding2 extends StatefulWidget {
  const onBoarding2({super.key});

  @override
  State<onBoarding2> createState() => _onBoarding1State();
}

class _onBoarding1State extends State<onBoarding2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 2)),
          Text(
            "Jaga Kesehatan Anda ",
            textAlign: TextAlign.center,
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Color(0xff6B7280),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Text(
            "Dan Janin Anda",
            textAlign: TextAlign.center,
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Color(0xff6B7280),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Kami akan memberikan himbauan bagi para ibu hamil supaya bisa tetap produktif walaupun dalam keadaan hamil, untuk menjaga kesehatan anda dan janis anda.",
            textAlign: TextAlign.center,
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Color(0xff6B7280),
              fontSize: 10.0,
            ),
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width / 1.1, 50),
              backgroundColor: Color(0xffFF6584),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(60.0),
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => WillPopScope(
                    onWillPop: () async => false,
                    child: Login(),
                  ),
                ),
              );
            },
            child: const Text("Next"),
          ),
        ],
      ),
    );
  }
}
