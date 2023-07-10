// ignore: file_names
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/HomePage.dart';
import 'package:flutter_project/MyPage1.dart';
import 'package:flutter_project/Login.dart';
import 'package:flutter_project/blocs/Signup_bloc.dart';
import 'package:flutter_project/blocs/Signup_event.dart';
import 'package:flutter_project/blocs/Signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SignUpPage extends StatelessWidget
{
  const SignUpPage({Key?key}):super(key:key);
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      backgroundColor: Colors.white,
      appBar: AppBar
      (
        title:const Center(child: Text("註冊")),
        backgroundColor: Colors.green
      ),
      body:BlocProvider<SignUpBloc>
      (
        create: (context)=>SignUpBloc(),
        child:BlocListener<SignUpBloc,SignUpState>
        (
          listener: (context,state)
          {
            if(state is CheckSignUpInputState)
            {
              if(state.isValid)
              {
                if(kDebugMode)
                {
                  print("註冊成功");
                  print("SignUpPage: Sign Up Successfully!!!");
                }
                Navigator.push
                (
                  context,MaterialPageRoute(builder: (context) => const MyPage1()),
                );
              }
              else
              {
                if(kDebugMode)
                {
                  print("註冊失敗");
                }
                Navigator.push
                (
                  context,MaterialPageRoute(builder: (context) => const HomePage()),
                );
              }
            }
            else if(state is GoLoginState)
            {
              if(kDebugMode)
              {
                print("請直接去登入");
              }
             // 在這裡檢查API資料是否含有使用者輸入的資料，執行相應的處理邏輯
              // 可以使用LoginStatusRepository中的getStatus方法來獲取API資料並進行比對
              // 根據比對結果執行相應的操作

              Navigator.push
              (
                context,MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            }
            else if(state is SignUpErrorState)
            {
              if((state.firstname?.isEmpty??true)||(state.lastname?.isEmpty??true)||(state.account?.isEmpty??true)||(state.password?.isEmpty??true))
              {
                if(kDebugMode)
                {
                  print("格式有錯誤");
                }
                Navigator.push
                (
                  context,MaterialPageRoute(builder: (context) => const HomePage()),
                );
              }
              else
              {
                if(kDebugMode)
                {
                  print("有其他錯誤");
                }
                Navigator.push
                (
                  context,MaterialPageRoute(builder: (context) => const HomePage()),
                );
              }
            }
          },
          child:const SignUpForm(),
        ),
      ),
    );
  }
}
class SignUpForm extends StatefulWidget
{
  const SignUpForm({Key?key}):super(key:key);
  @override
  // ignore: library_private_types_in_public_api
  _SignUpFormState createState()=>_SignUpFormState();
}
class _SignUpFormState extends State<SignUpForm>
{
  final TextEditingController _lastnameController=TextEditingController();
  final TextEditingController _firstnameController=TextEditingController();
  final TextEditingController _accountController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  @override
  void dispose()
  {
    _lastnameController.dispose();
    _firstnameController.dispose();
    _accountController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context)
  {
    return Container
    (
      padding: const EdgeInsets.all(16.0),
      child:Column
      (
        mainAxisAlignment: MainAxisAlignment.center,
        children: 
        [
          Row
          (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>
            [
              SizedBox
              (
                width:300,
                height:80,
                child:TextField
                (
                  controller: _lastnameController,
                  decoration: const InputDecoration
                  (
                    prefixIcon:Icon(Icons.person),
                    contentPadding:EdgeInsets.symmetric(vertical: 20),
                    labelText:"名字",
                    hintText: "Lastname",
                  ),
                ),
              ),
            ],
          ),
          Row
          (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>
            [
              SizedBox
              (
                width:300,
                height:80,
                child:TextField
                (
                  controller: _firstnameController,
                  decoration: const InputDecoration
                  (
                    prefixIcon:Icon(Icons.person_2_sharp),
                    contentPadding:EdgeInsets.symmetric(vertical: 20),
                    labelText:"姓氏",
                    hintText: "Firstname",
                  ),
                ),
              ),
            ],
          ),
          Row
          (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>
            [
              SizedBox
              (
                width:300,
                height:80,
                child:TextField
                (
                  controller: _accountController,
                  decoration: const InputDecoration
                  (
                    prefixIcon:Icon(Icons.email),
                    contentPadding:EdgeInsets.symmetric(vertical: 20),
                    labelText:"帳號",
                    hintText: "Email",
                  ),
                ),
              ),
            ],
          ),
          Row
          (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>
            [
              SizedBox
              (
                width:300,
                height:80,
                child:TextField
                (
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration
                  (
                    prefixIcon: Icon(Icons.lock),
                    labelText: "密碼",
                    hintText: "請輸入密碼",
                  ),
                ),
              ),
            ],
          ),
          Row
          (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>
            [
              SizedBox
              (
                height:48.0,
                width:150,
                child:TextButton
                (
                  child:const Text("註冊"),
                  onPressed: ()
                  {
                    _signupButtonPressed(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
void _signupButtonPressed(BuildContext context)
{
  String lastname= _lastnameController.text;
  String firstname=_firstnameController.text;
  String account= _accountController.text;
  String password=_passwordController.text;
  BlocProvider.of<SignUpBloc>(context).add
  (
    SignUpButtonPressed(lastname:lastname,firstname:firstname,account: account,password: password),
  );
}
}
      // body:SafeArea
      // (
      //   child:Container
      //   (
      //     padding:const EdgeInsets.all(16.0),
      //     child:Column
      //     (
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children:
      //       [
      //         Row
      //         (
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children:const <Widget>
      //           [
      //             SizedBox
      //             (
      //               width:300,
      //               child:TextField
      //               (
      //                 decoration: InputDecoration
      //                 (
      //                   prefixIcon:Icon(Icons.person_2_sharp),
      //                   labelText:'姓名',
      //                   hintText: '請輸入姓名',
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //         Row
      //         (
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children:const <Widget>
      //           [
      //             SizedBox
      //             (
      //               width:300,
      //               child:TextField
      //               (
      //                 decoration: InputDecoration
      //                 (
      //                   prefixIcon: Icon(Icons.email),
      //                   labelText: '帳號',
      //                   hintText: '請輸入帳號名或有效Email',
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //         Row
      //         (
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: const <Widget>
      //           [
      //             SizedBox
      //             (
      //               width:300,
      //               child:TextField
      //               (
      //                 obscureText:true,
      //                 decoration: InputDecoration
      //                 (
      //                   prefixIcon: Icon(Icons.vpn_key),
      //                   labelText:'密碼',
      //                   hintText: '請輸入密碼',
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //         Row
      //         (
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children:const <Widget>
      //           [
      //             SizedBox
      //             (
      //               width:300,
      //               child:TextField
      //               (
      //                 obscureText:true,
      //                 decoration: InputDecoration
      //                 (
      //                   prefixIcon: Icon(Icons.key),
      //                   labelText:'驗證密碼',
      //                   hintText: '請再一次輸入密碼',
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //         Row
      //         (
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: <Widget>
      //           [
      //             SizedBox
      //             (
      //               height:48.0,
      //               width:150,
      //               child:TextButton
      //               (
      //                 child:const Text
      //                 (
      //                   '註冊',
      //                   style:TextStyle(color:Colors.green),
      //                 ),
      //                 onPressed: ()
      //                 {
      //                   Navigator.push
      //                   (
      //                     context,MaterialPageRoute(builder: (context)=>const MyPage1())
      //                   );
      //                 },
      //               ),
      //             ),
      //           ],
      //         ),
      //         Row
      //         (
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: <Widget>
      //           [
      //             SizedBox
      //             (
      //               height: 48.0,
      //               child:TextButton
      //               (
      //                 child:const Text('第三方註冊?'),
      //                 onPressed: ()
      //                 {
      //                   Navigator.push
      //                   (
      //                     context,MaterialPageRoute(builder: (context)=>const ThirdEntrance())
      //                   );
      //                 },
      //               ),
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),

