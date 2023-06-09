import 'package:flutter/material.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:test_magang/Auth/login.dart';
import 'package:test_magang/Service/service_Api.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _notelp = TextEditingController();
  final TextEditingController _alamat = TextEditingController();
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> _register() async {
    try {
      final result = await ApiService.register(
        _username.text.trim(),
        _password.text.trim(),
        _notelp.text.trim(),
        _alamat.text.trim(),
      );
      if (result.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registration successful")),
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Registration failed. Please try again."),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("An error occurred: $e. Please try again."),
        ),
      );
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          child: Container(
            child: Stack(
              children: <Widget>[
                ClipPath(
                  clipper: CurvedClipper(),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/Maskgroup.png",
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 70,
                        ),
                        Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white),
                            color: Color.fromARGB(255, 247, 242, 242),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(4, 4),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Text("Register to your account"),
                              SizedBox(height: 20),
                              TextField(
                                controller: _username,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  hintText: 'Username',
                                  suffixIcon: Icon(
                                    CarbonIcons.user_avatar,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              TextField(
                                controller: _password,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  hintText: 'Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(_obscureText
                                        ? CarbonIcons.view_off
                                        : CarbonIcons.view),
                                    onPressed: _toggleVisibility,
                                  ),
                                ),
                                obscureText: _obscureText,
                              ),
                              SizedBox(height: 20),
                              TextField(
                                controller: _notelp,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  hintText: 'Nomor Telepon ',
                                  suffixIcon: Icon(
                                    CarbonIcons.phone,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              TextField(
                                controller: _alamat,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  hintText: 'Alamat ',
                                  suffixIcon: Icon(
                                    CarbonIcons.location,
                                  ),
                                ),
                              ),
                              SizedBox(height: 40),
                              SizedBox(
                                width: 400,
                                height: 40,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    backgroundColor: Color(0xffFF6584),
                                  ),
                                  onPressed: () {
                                    _register();
                                  },
                                  child: const Text("Register"),
                                ),
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                width: 400,
                                height: 40,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      backgroundColor: Colors.white),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Login(),
                                        ));
                                  },
                                  child: const Text(
                                    "Sudah Punya Akun",
                                    style: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
