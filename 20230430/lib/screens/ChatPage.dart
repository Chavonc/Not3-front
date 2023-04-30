// ignore: file_names
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget 
{
  const ChatPage({super.key});
  @override
  //ignore: library_private_types_in_public_api
  _ChatPageState createState()=>_ChatPageState();
}
class _ChatPageState extends State<ChatPage>
{
  final _textController=TextEditingController();
  String PostSeach='';
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      body:SingleChildScrollView
      (
        physics: const BouncingScrollPhysics(),
        child:Container
        (
          padding:const EdgeInsets.all(16.0),
          child:Column
          (
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>
            [
              IntrinsicHeight
              (
                child:Row
                (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    Expanded
                    (
                      child:Column
                      (
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>
                        [
                          Column
                          (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:const <Widget>
                            [
                              Padding
                              (
                                padding:EdgeInsets.only(left:3,top:0),
                                child:Text
                                (
                                  "聊天室",
                                  style:TextStyle(fontSize:20,fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Row
                          (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>
                            [
                              Column
                              (
                                children:<Widget>
                                [
                                  SizedBox
                                  (
                                    width:400,
                                    height:100,
                                    child:Padding
                                    (
                                      padding: const EdgeInsets.only(left: 50,top:35,right:10),
                                      child:TextField
                                      (
                                        controller: _textController,
                                        decoration: InputDecoration
                                        (
                                          hintText: "搜尋名字",
                                          hintStyle: TextStyle(color:Colors.grey.shade600),
                                          prefixIcon: Icon(Icons.search,color:Colors.grey.shade600,size:20),
                                          suffixIcon:IconButton
                                          (
                                            onPressed: ()
                                            {
                                              _textController.clear();
                                            },
                                            icon: const Icon(Icons.clear),
                                          ),
                                          filled:true,
                                          fillColor: Colors.grey.shade100,
                                          contentPadding: const EdgeInsets.all(8),
                                          enabledBorder: OutlineInputBorder
                                          (
                                            borderRadius: BorderRadius.circular(20),
                                            borderSide: BorderSide(color:Colors.grey.shade100)
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column
                              (
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>
                                [
                                  Padding
                                  (
                                    padding: const EdgeInsets.only(top:25),
                                    child:MaterialButton
                                    (
                                      onPressed: ()
                                      {
                                        setState(()
                                        {
                                          PostSeach=_textController.text;
                                        });
                                      },
                                      color:Colors.blue,
                                      child: const Text('Search',style:TextStyle(color:Colors.white))
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column
                          (
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>
                            [
                              Text(PostSeach),
                            ],
                          ),
                          Column
                          (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>
                            [
                              Card
                              (
                                child:Container
                                (
                                  height:50,
                                  color:Colors.black12,
                                ),
                              ),
                            ],
                          ),
                          Column
                          (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>
                            [
                              Card
                              (
                                child:Container
                                (
                                  height:50,
                                  color:Colors.black12,
                                ),
                              ),
                            ],
                          ),
                          Column
                          (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>
                            [
                              Card
                              (
                                child:Container
                                (
                                  height:50,
                                  color:Colors.black12,
                                ),
                              ),
                            ],
                          ),
                          Column
                          (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>
                            [
                              Card
                              (
                                child:Container
                                (
                                  height:50,
                                  color:Colors.black12,
                                ),
                              ),
                            ],
                          ),
                          Column
                          (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>
                            [
                              Card
                              (
                                child:Container
                                (
                                  height:50,
                                  color:Colors.black12,
                                ),
                              ),
                            ],
                          ),
                          Column
                          (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>
                            [
                              Card
                              (
                                child:Container
                                (
                                  height:50,
                                  color:Colors.black12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const VerticalDivider
                    (
                      color:Colors.grey,
                      width:10,
                      thickness: 3,
                      indent:10,
                      endIndent: 10,
                    ),
                    Expanded
                    (
                      child:Column
                      (
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>
                        [
                          Column
                          (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:<Widget>
                            [
                              Card
                              (
                                child:Container
                                (
                                  height:50,
                                  color:Colors.black12,
                                ),
                              ),
                            ],
                          ),
                          Column
                          (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>
                            [
                              Card
                              (
                                child:Container
                                (
                                  height:50,
                                  color:Colors.black12,
                                ),
                              ),
                            ],
                          ),
                          Column
                          (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>
                            [
                              Card
                              (
                                child:Container
                                (
                                  height:50,
                                  color:Colors.black12,
                                ),
                              ),
                            ],
                          ),
                          Column
                          (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>
                            [
                              Card
                              (
                                child:Container
                                (
                                  height:50,
                                  color:Colors.black12,
                                ),
                              ),
                            ],
                          ),
                          Column
                          (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>
                            [
                              Card
                              (
                                child:Container
                                (
                                  height:50,
                                  color:Colors.black12,
                                ),
                              ),
                            ],
                          ),
                          Column
                          (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>
                            [
                              Card
                              (
                                child:Container
                                (
                                  height:50,
                                  color:Colors.black12,
                                ),
                              ),
                            ],
                          ),
                          Column
                          (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>
                            [
                              Card
                              (
                                child:Container
                                (
                                  height:50,
                                  color:Colors.black12,
                                ),
                              ),
                            ],
                          ),
                          Column
                          (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>
                            [
                              Card
                              (
                                child:Container
                                (
                                  height:50,
                                  color:Colors.black12,
                                ),
                              ),
                            ],
                          ),
                          Column
                          (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>
                            [
                              Card
                              (
                                child:Container
                                (
                                  height:50,
                                  color:Colors.black12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
          ),
        ),
      )
    );
  }
}