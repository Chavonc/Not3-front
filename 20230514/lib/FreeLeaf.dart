// ignore: file_names
import 'package:flutter/material.dart';

class FreeLeaf extends StatefulWidget
{
  const FreeLeaf({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _FreeLeafState createState() => _FreeLeafState();
}

class _FreeLeafState extends State<FreeLeaf> 
{

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Center
        (
          child:Text('葉子名稱'),
        ),
        backgroundColor:Colors.green,
        elevation: 0.0,
      ),
      body: Container()
    );
  }
}