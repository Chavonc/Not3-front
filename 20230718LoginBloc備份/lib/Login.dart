// ignore: file_names
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_project/MyPage1.dart';
import 'package:flutter_project/Repository/LoginBloc_Repo.dart';
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
    final LoginBloc loginBloc=BlocProvider.of<LoginBloc>(context);
    return Scaffold
    (
      appBar: AppBar
      (
        title:const Center(child:Text("登入")),
        backgroundColor: Colors.green,
      ),
      body:Center
      (
        child:BlocBuilder<LoginBloc,LoginState>
        (
          builder:(context,state)
          {
            if(state is LoginInitialState||state is LoginLoadingState)
            {
              return buildLoginForm(context);
            }
            else if(state is LoginSuccessState)
            {
              return buildSuccessMessage(state,context);
            }
            else if(state is LoginFailureState)
            {
              return buildFailureMessage(state,context);
            }
            return Container();
          },
        ),      
      ),
    );
  }
  Widget buildLoginForm(BuildContext context)
  {
    final LoginBloc loginBloc=BlocProvider.of<LoginBloc>(context);
    String account='';
    String password='';

    return Column
    (
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> 
      [
        SizedBox
        (
          width: 300,
          height: 80,
          child:TextField
          (
            decoration: const InputDecoration
            (
              hintText: 'Enter Account',
              labelText: "帳號",
              prefixIcon: Icon(Icons.person),
            ),
            onChanged: (value)
            {
              account=value;
            },
          ),
        ),
        SizedBox
        (
          width: 300,
          height: 80,
          child:TextField
          (
            obscureText: true,
            decoration: const InputDecoration
            (
              hintText: 'Enter Password',
              labelText: "密碼",
              prefixIcon: Icon(Icons.lock),
            ),
            onChanged: (value)
            {
              password=value;
            },
          ),
        ),
        SizedBox
        (
          width: 150,
          height: 48,
          child: FilledButton.tonal
          (
            style:FilledButton.styleFrom
            (
              backgroundColor: const Color.fromARGB(255, 204, 189, 247),
              foregroundColor: Colors.white,//TextColor
              textStyle: const TextStyle
              (
                fontWeight: FontWeight.bold,
                fontSize: 14,
              )
            ),
            onPressed: ()
            {
              loginBloc.add(LoginButtonPressedEvent(account: account, password: password));
            }, 
            child: const Text('登入'),
          ),
        ),
      ],
    );
  }
  Widget buildSuccessMessage(LoginSuccessState state,BuildContext context)
  {
    final LoginBloc loginBloc=BlocProvider.of<LoginBloc>(context);
    return Column
    (
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>
      [
        Text('Access Token:${state.accessToken}'),
        Text('IP Address:${state.ipAddress}'),
        ElevatedButton
        (
          onPressed: ()
          {
            loginBloc.add(LoginRefreshEvent());
          },
          child: const Text('Refresh'),
        )
      ],
    );
  }
  Widget buildFailureMessage(LoginFailureState state,BuildContext context)
  {
    final LoginBloc loginBloc=BlocProvider.of<LoginBloc>(context);
    return Column
    (
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>
      [
        Text(state.errorMessage),
        ElevatedButton
        (
          onPressed: ()
          {
            loginBloc.add(LoginRefreshEvent());
          }, 
          child: const Text('Refresh'),
        ),
      ],
    );
  }
}

// class LoginForm extends StatefulWidget
// {
//   const LoginForm({Key?key}):super(key:key);
//   @override
//   // ignore: library_private_types_in_public_api
//   _LoginFormState createState()=> _LoginFormState();
// }
// class _LoginFormState extends State<LoginForm>
// {
//   final TextEditingController _accountController=TextEditingController();
//   final TextEditingController _passwordController=TextEditingController();
//   @override
//   void dispose()
//   {
//     _accountController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context)
//   {
//     return Container
//     (
//       padding: const EdgeInsets.all(16.0),
//       child:Column
//       (
//         mainAxisAlignment: MainAxisAlignment.center,
//         children:
//         [
//           Row
//           (
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>
//             [
//               SizedBox
//               (
//                 width:300,
//                 height:80,
//                 child: TextField
//                 (
//                   controller:_accountController,
//                   decoration: const InputDecoration
//                   (
//                     prefixIcon: Icon(Icons.person),
//                     contentPadding: EdgeInsets.symmetric(vertical: 20),
//                     labelText: "帳號",
//                     hintText: "請輸入Email",
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Row
//           (
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>
//             [
//               SizedBox
//               (
//                 width:300,
//                 height:80,
//                 child:TextField
//                 (
//                   controller: _passwordController,
//                   obscureText: true,
//                   decoration: const InputDecoration
//                   (
//                     prefixIcon: Icon(Icons.lock),
//                     labelText: "密碼",
//                     hintText: "請輸入密碼",
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Row
//           (
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>
//             [
//               SizedBox
//               (
//                 height:48.0,
//                 width:150,
//                 child:TextButton
//                 (
//                   child:const Text("登入"),
//                   onPressed: ()
//                   {
//                     _loginButtonPressed(context);
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
  // void _loginButtonPressed(BuildContext context)
  // {
  //   String account= _accountController.text;
  //   String password=_passwordController.text;
  //   final loginRepository=LoginRepository();
  //   loginRepository.checkLogin(account, password).then((isMatch)//比對
  //   {
  //     if(isMatch)
  //     {
  //       BlocProvider.of<LoginBloc>(context).add(LoginSuccessEvent());
  //     }
  //     else
  //     {
  //       BlocProvider.of<LoginBloc>(context).add(GoSignUpEvent());
  //     }
  //   }).catchError((error)
  //   {
  //     BlocProvider.of<LoginBloc>(context).add(ErrorEvent());
  //   });
    
  //   BlocProvider.of<LoginBloc>(context).add
  //   (
  //     LoginButtonPressed(account: account,password: password),
  //   );
  // }
