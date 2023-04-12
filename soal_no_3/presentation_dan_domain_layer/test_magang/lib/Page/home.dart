import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:test_magang/Service/service_Api.dart';
import 'package:test_magang/Model/user_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<user_model>> _fetchData() async {
    final userService = UserService();
    final userList = await userService.getAllUsers();
    return userList.map((userJson) => user_model.fromJson(userJson)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffFF6584),
              Color(0xffFFB199),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: FutureBuilder<List<user_model>>(
            future: _fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final dataList = snapshot.data!;

                return ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    final data = dataList[index];

                    return Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.grey,
                            Colors.white,
                          ],
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.id.toString(),
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            data.username!,
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            data.noTelp!,
                            style: TextStyle(fontSize: 15),
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      String? username = data.username;
                                      String? password = data.password;
                                      String? noTelp = data.noTelp;
                                      String? alamat = data.alamat;

                                      return AlertDialog(
                                        title: Text('Update User Data'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextField(
                                              decoration: InputDecoration(
                                                  labelText: 'Username'),
                                              onChanged: (value) {
                                                username = value;
                                              },
                                              controller: TextEditingController(
                                                  text: username),
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                  labelText: 'Password'),
                                              onChanged: (value) {
                                                password = value;
                                              },
                                              controller: TextEditingController(
                                                  text: password),
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                  labelText: 'No. Telp'),
                                              onChanged: (value) {
                                                noTelp = value;
                                              },
                                              controller: TextEditingController(
                                                  text: noTelp),
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                  labelText: 'Alamat'),
                                              onChanged: (value) {
                                                alamat = value;
                                              },
                                              controller: TextEditingController(
                                                  text: alamat),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              UserUpdate().updateUser(
                                                  data.id!.toString(),
                                                  username!,
                                                  password!,
                                                  noTelp!,
                                                  alamat!);
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        WillPopScope(
                                                      onWillPop: () async =>
                                                          false,
                                                      child: Home(),
                                                    ),
                                                  ));
                                            },
                                            child: Text('Update'),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Cancel'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text('Update'),
                              ),
                              SizedBox(width: 8),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.red,
                                ),
                                onPressed: () async {
                                  Map<String, dynamic> result =
                                      await UserDelete()
                                          .deleteUser(data.id!.toString());

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('Delete ${data.username}')),
                                  );
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => WillPopScope(
                                          onWillPop: () async => false,
                                          child: Home(),
                                        ),
                                      ));
                                },
                                child: Text('Delete'),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
