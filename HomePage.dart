// ignore: file_names
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget 
{
  const HomePage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  GoToLogin createState() => GoToLogin();
}
class GoToLogin extends State<HomePage> 
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text('Not3 Home Page'),
      ),
      body: Center
      (
        child: Container
        (
          //children:const <Widget>
          //[
            //TextButton
            //(
              //onPressed:null, 
              //child: Text('Login'),
            //),
          //]
          height: 80,
          width: 150,
          decoration: BoxDecoration
          (
          color: const Color.fromARGB(255, 20, 133, 0), borderRadius: BorderRadius.circular(10)),
          child: TextButton
          (
             onPressed: () 
             {
               Navigator.pop(context);
             },
             child: const Text
             (
               '登錄',
               style: TextStyle(color: Colors.white, fontSize: 15),
             ),
          ),
        ),
      ),
    );
  }
}
