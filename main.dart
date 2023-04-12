//import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
//import "HomePage.dart";
//import "Login.dart";
//import "SignUp.dart";
import "ThirdEntrance.dart";
void main()=>runApp(const NotApp());
class NotApp extends StatelessWidget
{
  const NotApp({super.key});
  @override
  Widget build(BuildContext context)
  {
    // ignore: prefer_const_constructors
    return MaterialApp
    (
      title: "Not3 App",
      home: const Center
      (
        child: Scaffold
        (
          //backgroundColor: Colors.grey,
          body:ThirdEntrance()
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}