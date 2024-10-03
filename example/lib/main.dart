import 'package:flutter/material.dart';
import 'package:rapid_craft/rapid_craft.dart'; // Make sure this import is present

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            "Hello".linearGradient([Colors.red, Colors.blue]).show(),
            "Ke re".linearGradient([Colors.red, Colors.blue]).onTap((){
              print("Ke re");
            }).textSpan(
              "Hello".linearGradient([Colors.brown, Colors.green]).onTap((){
                print("Hello");
              }),
            ).textSpan(
              "Hefffffllo".linearGradient([Colors.orange, Colors.green]).onTap((){
                print("Hefffffllo");
              }),
            ).show(),
            "Gradient".sweepGradient([Colors.purple, Colors.orange]).show(),
            "Gradient".linearGradient([Colors.purple, Colors.orange]).show(),
         RcBox()
         .height(50)
         .width(50)
         .amber
         .show(),
          ],
        ),
      ),
    );
  }
}
