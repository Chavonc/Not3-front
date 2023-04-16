// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/ChatPage.dart';
import 'package:flutter_project/screens/FruitsPage.dart';
import 'package:flutter_project/screens/LeafPage.dart';
import 'package:flutter_project/AnimationBottomBar.dart';
class MyPage extends StatefulWidget
{
  const MyPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _MyPageState createState()=>_MyPageState();
}
class _MyPageState extends State<MyPage>
{
  int pageIndex=0;
  List<Widget> pageItem=[];

  @override
  void initState()
  {
    super.initState();
    pageItem=[const ChatPage(),const LeafPage(),const FruitsPage()];
  }
  final List<BarItemData> barItems=
  [
    BarItemData("聊天室",Icons.accessibility,const Color.fromARGB(212, 0, 255, 0)),
    BarItemData("葉子",Icons.energy_savings_leaf,const Color.fromARGB(212, 0, 255, 0)),
    BarItemData("檢視果實",Icons.feed,const Color.fromARGB(212, 0, 255, 0))
  ];
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Center(child: Text('Not3')),
        backgroundColor: Colors.green,
        elevation: 0.0,
        leading:IconButton
        (
          icon:const Icon(Icons.person),
          tooltip: '使用者',
          onPressed: ()=>debugPrint('User button is pressed.'),
        ),
        actions:<Widget>
        [
          IconButton
          (
            icon:const Icon(Icons.settings),
            tooltip:'設定',
            onPressed: ()
            {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('這是設定')));
            },
          ),
        ],
      ),
      body:IndexedStack
      (
        index:pageIndex,
        children: pageItem,
      ),
      bottomNavigationBar: AnimationBottomBar
      (
        barItemsData:barItems,
        barStyle:BarStyle(fontSize:20.0,fontWeight:FontWeight.w400,iconSize:30.0),
        changePageIndex:(int index)
        {
          setState(() 
          {
            pageIndex=index;
          });
        }, 
      ),
    );
  }
}