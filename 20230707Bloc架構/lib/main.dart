import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
//import "package:flutter_project/Login.dart";
import "package:flutter_project/HomePage.dart";
import 'blocs/Login_bloc.dart';
void main()=>runApp(const MyApp());
class MyApp extends StatelessWidget
{
  const MyApp({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      title: "Not3 App",
      debugShowCheckedModeBanner: false,
      home: Scaffold
      (
        body:BlocProvider<LoginBloc>
        (
          create:(context)=>LoginBloc(),
          child:const HomePage()
        ),
      ),
    );
  }
}