import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard.dart';
import 'login.dart';
import 'register.dart';
import 'splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: ListView(children:[
            Text("Welcome to Flutter", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: 60),
            

            Text("Assignment 1", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  Get.to(() => Splashscreen());
                },
                child: const Text('Splashscreen: Kenfred'),
              ),
            ),
            SizedBox(height: 60),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                Get.to(() => const Login());
              },
              child: const Text('Login : Caleb'),
            ),
            SizedBox(height: 60),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),  
              onPressed: () {
                Get.to(() => const Register());
              },
              child: const Text('Register : Alex'),
            ),
            SizedBox(height: 60),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: () {
                Get.to(() => const Dashboard());
              },
              child: const Text('Dashboard : Edwin'),
            ),
          
          ],),
        )
      )
    );
  }
}