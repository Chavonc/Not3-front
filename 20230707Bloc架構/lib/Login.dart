// ignore: file_names
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/MyPage1.dart';
import 'package:flutter_project/blocs/Login_bloc.dart';
import 'package:flutter_project/blocs/Login_event.dart';
import 'package:flutter_project/HomePage.dart';
import 'package:flutter_project/blocs/Login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/SignUp.dart';
class LoginPage extends StatelessWidget
{
  const LoginPage({Key?key}):super(key:key);
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title:const Center(child:Text("登入")),
        backgroundColor: Colors.green,
      ),
      body:BlocProvider<LoginBloc>
      (
        create:(context)=>LoginBloc(),
        child:BlocListener<LoginBloc,LoginState>
        (
          listener:(context, state)
          {
            if(state is CheckInputState)//if true
            {
              if(state.isValid)
              {
                if (kDebugMode) 
                {
                  print("登入成功");
                  print("LoginPage: Login Successfully!!!");
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
                  print("登入失敗");
                }
                Navigator.push
                (
                  context,MaterialPageRoute(builder: (context) => const HomePage()),
                );
              }

            }
            else if(state is GoSignUpState)
            {
              if (kDebugMode) 
              {
                print("請去註冊");
              }
              // 在這裡檢查API資料是否含有使用者輸入的資料，執行相應的處理邏輯
              // 可以使用LoginStatusRepository中的getStatus方法來獲取API資料並進行比對
              // 根據比對結果執行相應的操作
              Navigator.push
              (
                context,MaterialPageRoute(builder: (context) => const SignUpPage()),
              );
            }
            else if(state is ErrorState)
            {
              if (kDebugMode) 
              {
                print("格式有錯誤");
              }
              Navigator.push
              (
                context,MaterialPageRoute(builder: (context) => const HomePage()),
              );
            }
          },
          child:const LoginForm(),
        ),
      ),
    );
  }
}
class LoginForm extends StatefulWidget
{
  const LoginForm({Key?key}):super(key:key);
  @override
  // ignore: library_private_types_in_public_api
  _LoginFormState createState()=> _LoginFormState();
}
class _LoginFormState extends State<LoginForm>
{
  final TextEditingController _accountController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  @override
  void dispose()
  {
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
                child: TextField
                (
                  controller:_accountController,
                  decoration: const InputDecoration
                  (
                    prefixIcon: Icon(Icons.person),
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                    labelText: "帳號",
                    hintText: "請輸入Email",
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
                  child:const Text("登入"),
                  onPressed: ()
                  {
                    _loginButtonPressed(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  void _loginButtonPressed(BuildContext context)
  {
    String account= _accountController.text;
    String password=_passwordController.text;
    BlocProvider.of<LoginBloc>(context).add
    (
      LoginButtonPressed(account: account,password: password),
    );
  }
}
        // child:BlocBuilder<LoginBloc,LoginState>
        // (
        //   builder:(context, state)
        //   {
        //     if(state is InitState)
        //     {
        //       return buildLoginForm(context);
        //     }
        //     else if(state is CheckInputState)
        //     {
        //       return buildSuccessUI(context);
        //     }
        //     else if(state is ErrorState)
        //     {
        //       return buildErrorUI(context);
        //     }
        //     else
        //     {
        //       return buildLoadingUI(context);
        //     }
        //   },
        // ),
  // Widget buildLoginForm(context)
  // {
  //   return Scaffold
  //   (
  //     appBar: AppBar
  //     (
  //       title:const Center(child: Text("登入")),
  //       backgroundColor: Colors.green
  //     ),
  //     body: SafeArea
  //     (
  //       child:Container
  //       (
  //         padding:const EdgeInsets.all(16.0),
  //         child: Column
  //         (
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children:
  //           [
  //             const Row
  //             (
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children:<Widget>
  //               [
  //                 SizedBox
  //                 (
  //                   width:300,
  //                   height:80,
  //                   child: TextField
  //                   (
  //                     decoration:InputDecoration
  //                     (
  //                       prefixIcon: Icon(Icons.person),
  //                       contentPadding:EdgeInsets.symmetric(vertical: 20),
  //                       labelText: "帳號",
  //                       hintText: "請輸入Email",
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             const Row
  //             (
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children:<Widget>
  //               [
  //                 SizedBox
  //                 (
  //                   width:300,
  //                   height:80,
  //                   child: TextField
  //                   (
  //                     obscureText: true,
  //                     decoration: InputDecoration
  //                     (
  //                       prefixIcon: Icon(Icons.lock),
  //                       labelText: "密碼",
  //                       hintText: "請輸入密碼",
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Row
  //             (
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children:<Widget>
  //               [
  //                 SizedBox
  //                 (
  //                   //width: MediaQuery.of(context).size.width - 48.0,
  //                   height: 48.0,
  //                   child: TextButton
  //                   (
  //                     child: const Text("登入"),
  //                     onPressed: () 
  //                     {
  //                       _loginButtonOnPressed();
  //                     },
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Row
  //             (
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children:<Widget>
  //               [
  //                 SizedBox
  //                 (
  //                   //width: MediaQuery.of(context).size.width - 48.0,
  //                   height: 48.0,
  //                   child: TextButton
  //                   (
  //                     child: const Text("第三方登入?"),
  //                     onPressed: () 
  //                     {                  
  //                       Navigator.push
  //                       (
  //                         context,MaterialPageRoute(builder:(context)=> const ThirdEntrance())
  //                       );
  //                     },
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  // void _loginButtonOnPressed()
  // {
  //   if(kDebugMode)
  //   {
  //     print("The Login Button has been clicked!");
  //   }
  // }
  // Widget buildSuccessUI(context)
  // {
  //   return Scaffold
  //   (
  //     appBar: AppBar
  //     (
  //       title:const Center(child: Text("成功登入")),
  //       backgroundColor: Colors.green
  //     ),
  //     body: SafeArea
  //     (
  //       child:Container
  //       (
  //         padding:const EdgeInsets.all(16.0),
  //         child: Column
  //         (
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children:
  //           [
  //             const Text
  //             (
  //               'Success'
  //             ),
  //             Row
  //             (
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children:<Widget>
  //               [
  //                 SizedBox
  //                 (
  //                   //width: MediaQuery.of(context).size.width - 48.0,
  //                   height: 48.0,
  //                   child: TextButton
  //                   (
  //                     child: const Text("耶~"),
  //                     onPressed: () 
  //                     {
  //                       _loginSuccessOnPressed();
  //                     },
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  // void _loginSuccessOnPressed()
  // {
  //   if(kDebugMode)
  //   {
  //     print("Success!");
  //   }
  // }

  // Widget buildErrorUI(context)
  // {
  //   return Scaffold
  //   (
  //     appBar: AppBar
  //     (
  //       title:const Center(child: Text("登入失敗")),
  //       backgroundColor: Colors.green
  //     ),
  //     body: SafeArea
  //     (
  //       child:Container
  //       (
  //         padding:const EdgeInsets.all(16.0),
  //         child: Column
  //         (
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children:
  //           [
  //             const Text
  //             (
  //               '請去註冊帳號'
  //             ),
  //             Row
  //             (
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children:<Widget>
  //               [
  //                 SizedBox
  //                 (
  //                   //width: MediaQuery.of(context).size.width - 48.0,
  //                   height: 48.0,
  //                   child: TextButton
  //                   (
  //                     child: const Text("拜拜"),
  //                     onPressed: () 
  //                     {
  //                       _loginFailureOnPressed();
  //                     },
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  // void _loginFailureOnPressed()
  // {
  //   if(kDebugMode)
  //   {
  //     print("Failure!");
  //   }
  // }
  // Widget buildLoadingUI(context)
  // {
  //   return Scaffold
  //   (
  //     appBar: AppBar
  //     (
  //       title:const Center(child: Text("Loading中...")),
  //       backgroundColor: Colors.green
  //     ),
  //     body: SafeArea
  //     (
  //       child:Container
  //       (
  //         padding:const EdgeInsets.all(16.0),
  //         child: Column
  //         (
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children:
  //           [
  //             const Text
  //             (
  //               'Loading中...有問題噢'
  //             ),
  //             Row
  //             (
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children:<Widget>
  //               [
  //                 SizedBox
  //                 (
  //                   //width: MediaQuery.of(context).size.width - 48.0,
  //                   height: 48.0,
  //                   child: TextButton
  //                   (
  //                     child: const Text("拜拜"),
  //                     onPressed: () 
  //                     {
  //                       _loginLoadingOnPressed();
  //                     },
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  // void _loginLoadingOnPressed()
  // {
  //   if(kDebugMode)
  //   {
  //     print("Loading~");
  //   }
  // }

// class LoginPage extends StatefulWidget
// {
//   const LoginPage({super.key});
//   @override
//   // ignore: library_private_types_in_public_api
//   _LoginPageState createState()=>_LoginPageState();
// }
// class _LoginPageState extends State<LoginPage> 
// {
//   @override
//   Widget build(BuildContext context) 
//   {
//     return Scaffold
//     (
//       appBar: AppBar
//       (
//         title:const Center(child: Text("登入")),
//         backgroundColor: Colors.green
//       ),
//       body: SafeArea
//       (
//         child:Container
//         (
//           padding:const EdgeInsets.all(16.0),
//           child: Column
//           (
//             mainAxisAlignment: MainAxisAlignment.center,
//             children:
//             [
//               const Row
//               (
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children:<Widget>
//                 [
//                   SizedBox
//                   (
//                     width:300,
//                     height:80,
//                     child: TextField
//                     (
//                       decoration:InputDecoration
//                       (
//                         prefixIcon: Icon(Icons.person),
//                         contentPadding:EdgeInsets.symmetric(vertical: 20),
//                         labelText: "帳號",
//                         hintText: "請輸入Email",
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const Row
//               (
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children:<Widget>
//                 [
//                   SizedBox
//                   (
//                     width:300,
//                     height:80,
//                     child: TextField
//                     (
//                       obscureText: true,
//                       decoration: InputDecoration
//                       (
//                         prefixIcon: Icon(Icons.lock),
//                         labelText: "密碼",
//                         hintText: "請輸入密碼",
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Row
//               (
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children:<Widget>
//                 [
//                   SizedBox
//                   (
//                     //width: MediaQuery.of(context).size.width - 48.0,
//                     height: 48.0,
//                     child: TextButton
//                     (
//                       child: const Text("登入"),
//                       onPressed: () 
//                       {
//                         _LoginButtonOnPressed();
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               Row
//               (
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children:<Widget>
//                 [
//                   SizedBox
//                   (
//                     //width: MediaQuery.of(context).size.width - 48.0,
//                     height: 48.0,
//                     child: TextButton
//                     (
//                       child: const Text("第三方登入?"),
//                       onPressed: () 
//                       {                  
//                         Navigator.push
//                         (
//                           context,MaterialPageRoute(builder:(context)=> const ThirdEntrance())
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   // ignore: non_constant_identifier_names
//   void _LoginButtonOnPressed()
//   {
//     if(kDebugMode)
//     {
//       print("The Login Button has been clicked!");
//     }
//   }
// }