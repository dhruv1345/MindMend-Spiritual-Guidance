import 'package:bhagwat_gita_app/joincall.dart';
import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  static String name = "";
  static String userId = ""; // Fixed the variable name here

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login as a user!"),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (val) {
                  MyLogin.name = val; // Fixed the reference here
                },
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (val) {
                  MyLogin.userId = val; // Fixed the reference here
                },
                decoration: InputDecoration(
                  hintText: "userId",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // You can access MyLogin.name and MyLogin.userId here
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const JoinCall()));
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
