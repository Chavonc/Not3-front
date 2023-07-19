import 'dart:convert';
import 'package:http/http.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/blocs/Signup_event.dart';
import 'package:flutter_project/blocs/Signup_state.dart';
import '../models/SignUpModel.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> 
{
  SignUpBloc() : super(InitialState());
  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event)async*
  {
    if(event is SignUpButtonPressed)
    {
      yield* _mapSignUpButtonPressedToState(event);
    }
  }
  Stream<SignUpState> _mapSignUpButtonPressedToState(SignUpButtonPressed event)async*
  {
      try
      {
        if((event.firstname.isEmpty)||(event.lastname.isEmpty)||(event.account.isEmpty)||(event.password.isEmpty))
        {// 檢查使用者是否有在TextField裡輸入資料
          if(kDebugMode)
          {
            print("資料未輸入完整");
            yield const CheckSignUpInputState(false);// 沒有輸入資料
            yield SignUpErrorState();
            return;
          }
        }
        if(kDebugMode)
        {
          print("資料已輸入完整");
          yield const CheckSignUpInputState(true);// 有輸入資料
          //print("註冊成功");
          //print("Sign Up Successfully!!!");
        }
      }
      catch(error)
      {
        if(kDebugMode)
        {
          print('發生錯誤:');
          print('$error');
        }
        yield SignUpErrorState();// 發生錯誤
      }
  }
}

// Future<String> getServerIPAdress() async
// {
//   var response=await get(Uri.parse('http://api.ipify.org?format=json'));
//   if(response.statusCode==200)
//   {
//     var data=json.decode(response.body);
//     String ipAddress=data['ip'];
//     if (kDebugMode) 
//     {
//       print(ipAddress);
//     }
//     return ipAddress;
//   }
//   else
//   {
//     throw Exception('無法取得伺服器IP地址');
//   }
// }
// Future<dynamic> fetchDataFromAPI(String ipAddress)async
// {
//   var response=await get(Uri.parse('http://$ipAddress/api/endpoint'));
//   if(response.statusCode==200)
//   {
//     var data=json.decode(response.body);
//     return data;
//   }
//   else
//   {
//     throw Exception('無法從API取得資料');
//   }
// }
Future <bool> checkRegisterData(String lastname,String firstname,String account,String password)async
{
  return false;// 假設檢查成功/不成功
}

class SignUpStatusRepository//API
{
  String loginUrl = 'https://reqres.in/api/users?page=2';

  Future<List<SignUpModel>> getStatus() async 
  {
    try
    {
      Response response = await get(Uri.parse(loginUrl));
      if (response.statusCode == 200) 
      {
        final List result = jsonDecode(response.body)['data'];
        //print
        if (kDebugMode) 
        {
          print('Resopnse body:${response.body}');
        }
        if (kDebugMode) 
        {
          print('Parsed data:$result');
        }
        return result.map((e) => SignUpModel.fromJson(e)).toList();
      } 
      else 
      {
        throw Exception(response.reasonPhrase);
      }
    }
    catch(error)
    {
      throw Exception(error.toString());  
    }
  }
}