// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_project/Login.dart';
import 'package:flutter_project/SignUp.dart';
class HomePage extends StatelessWidget 
{
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        //leading:const Icon(Icons.abc),
        title:const Center(child: Text("Not3主頁")),
        backgroundColor: Colors.green
      ),
      body: SingleChildScrollView
      (
        child: Row
        (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>
          [ //1.要加個colomn寫text:welcome!!!
            //2.記得要加個image來代替我們logo
            // Center
            // (
            //   child:Container
            //   (
            //     height: 60,
            //     width: 150,
            //     alignment:Alignment.center,
            //     child: const Icon
            //     (
            //       Icons.account_tree
            //     ),
            //   ),
            // ),
            Center
            (
              child:Container
              (
                height: 60,
                width: 150,
                alignment:Alignment.center,
                decoration: BoxDecoration
                (
                  color: const Color.fromARGB(222, 37, 191, 10), borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(8.0),
                child: TextButton
                (
                  onPressed: () 
                  {
                    Navigator.push
                    (
                      context,MaterialPageRoute(builder:(_)=> const LoginPage())
                    );
                  },
                  child: const Text
                  (
                    '登錄',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              // ignore: avoid_unnecessary_containers
            ),
            Center
            (
              child:Container
              (
                height: 60,
                width: 150,
                decoration: BoxDecoration
                (
                  color: const Color.fromARGB(222, 37, 191, 10), borderRadius: BorderRadius.circular(10)
                ),

                child:TextButton
                (
                  onPressed: () 
                  {
                    Navigator.push
                    (
                      context,MaterialPageRoute(builder:(_)=> const SignUpPage())
                    );
                  },
                  child: const Text
                  (
                    '註冊',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}