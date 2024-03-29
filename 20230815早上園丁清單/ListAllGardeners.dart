import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ListAllGardeners extends StatefulWidget 
{
  const ListAllGardeners({super.key});
  @override
  //ignore: library_private_types_in_public_api
  _ListAllGardenersState createState()=>_ListAllGardenersState();
}
class _ListAllGardenersState extends State<ListAllGardeners>
{
  List<Map<String,dynamic>> getGardenerList=[];
  final _storage = const FlutterSecureStorage();
  bool isListVisible=false;
  Future<String?> getRoomUUID()async
  {
    String? roomUUID = await _storage.read(key:'roomUUID');
    if (kDebugMode) 
    {
      print('getRoomUUID: $roomUUID');
    }
    return roomUUID;
  }
  Future<void>listAllGardeners()async
  {
    final savedRoomUUID=await getRoomUUID();
    try
    {
      final response=await http.post
      (
        Uri.parse('http://120.126.16.222/gardenerofleafs/get-all-gardener'),
        headers:<String,String>
        {
          'Content-Type':'application/json',
        },
        body:jsonEncode(<String,String>
        {
          'leaf_id':savedRoomUUID!,
        }),
      );
      if(kDebugMode)
      {
        print("Get-All-Gardeners: $savedRoomUUID");
      }
      if(response.statusCode>=200&&response.statusCode<300)
      {
        final responseData=jsonDecode(response.body);
        setState(() 
        {
          getGardenerList=List<Map<String,dynamic>>.from(responseData);
          isListVisible=true;
          _showGardenerListDialog(context);
          if (kDebugMode) 
          {
            print('傳送之後getGardenerList:$getGardenerList');
          }
        });
        if(kDebugMode)
        {
          print('listAllGardeners 回傳資料: $responseData');
        }
      }
      else
      {
        if(kDebugMode)
        {
          print('Error:請求失敗\n$response\nStatusCode: ${response.statusCode}');
        }
      }
    }
    catch(error)
    {
      if(kDebugMode)
      {
        print('Catch Error: $error');
      }
    }
  }
  void _showGardenerListDialog(BuildContext context)
  {
    showDialog
    (
      context: context, 
      builder: (BuildContext context)
      {
        return AlertDialog
        (
          title: const Text('葉子園丁清單'),
          content: SingleChildScrollView
          (
            child: ListBody
            (
              children:getGardenerList.map((gardener)
              {
                return ListTile
                (
                  title: Text(gardener['first_name']),
                  subtitle: Text('Account: ${gardener['account']}'),
                  // trailing: Checkbox
                  // (
                  //   value: false,
                  //   onChanged: (value)
                  //   {
                  //     //Checkbox被點擊時觸發的函數
                  //     //將使用者移除的動作await deleteGardener();
                  //   },
                  // ),
                );
              }).toList(),
            ),
          ),
          actions: 
          [
            ElevatedButton
            (
              onPressed:()
              {
                Navigator.of(context).pop();
              }, 
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        backgroundColor: Colors.green,
        title: const Text('AppBar with IconButton'),
        actions: 
        [
          PopupMenuButton<void>
          (
            onSelected: (value)
            {
              listAllGardeners();
            },
            itemBuilder: (BuildContext context)
            {
              return
              [
                const PopupMenuItem
                (
                  // ignore: void_checks
                  value:1,
                  child: Text('Gardener List'),
                ),
              ];
            },
            icon: const Icon(Icons.list_alt), 
          ),
        ],
      ),
      body:const Center
      (
        child: Text('QuickStart的部分'),
      ),
    );
  }
}