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
    return const Scaffold
    (
      body:Center
      (
        child: Text("創建葉子")
      )
    );
  }

}