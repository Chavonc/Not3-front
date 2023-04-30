// ignore: file_names
import 'package:flutter/material.dart';
class StartLeafPage extends StatefulWidget 
{
  const StartLeafPage({super.key});
  @override
  //ignore: library_private_types_in_public_api
  _StartLeafPageState createState()=>_StartLeafPageState();
}
class _StartLeafPageState extends State<StartLeafPage>
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      backgroundColor: Colors.white,
      body:SafeArea
      (
        child: Container
        (
          padding:const EdgeInsets.all(16.0),
          child:Column
          (
            //mainAxisAlignment: MainAxisAlignment.end,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: 
            [
              Row
              (
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>
                [
                  Text("創建葉子"),
                  //Text('$addButton'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}