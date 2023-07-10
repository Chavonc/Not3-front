import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/blocs/Login_event.dart';
import 'package:flutter_project/blocs/Login_state.dart';
import 'package:http/http.dart';
import '../models/LoginModel.dart';
class LoginBloc extends Bloc<LoginEvent, LoginState> 
{
  LoginBloc():super(InitState());
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async*
  {
    if(event is LoginButtonPressed)
    {
      yield* _mapLoginButtonPressedToState(event);
    }
  }
  Stream<LoginState> _mapLoginButtonPressedToState(LoginButtonPressed event)async*
  {
    try
    {
      if(event.account.isEmpty||event.password.isEmpty)// 檢查使用者是否有在TextField裡輸入資料
      {
        if(kDebugMode)
        {
          print("資料未輸入完整");
          yield const CheckInputState(false);// 沒有輸入資料
          yield ErrorState();
        }
      }
      else
      {
        if(kDebugMode)
        {
          print("資料已輸入完整");
          yield const CheckInputState(true);// 有輸入資料
          //print("登入成功");
          //print("Login Successfully!!!");
        }
      }
    }
    catch(error)
    {
      if (kDebugMode) 
      {
        print('發生錯誤:');
        print('$error');
      }
      yield ErrorState();// 發生錯誤，發出ErrorState
    }
  }
}
Future<bool> checkAccountAndPassword(String account,String password)async
{
  return true;// 假設帳號密碼檢查成功
}
// Future<bool>isRegistered(String account)async// 調用API來檢查帳號是否已註冊
// {
//   final List<LoginModel>loginModels=await getStatus();
//   return loginModels.any((login)=>login.account==account);
// }

class LoginStatusRepository//API
{
  String loginUrl = 'https://reqres.in/api/users?page=2';

  Future<List<LoginModel>> getStatus() async 
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
        return result.map((e) => LoginModel.fromJson(e)).toList();
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
  // final HomeStatusRepository _homeStatusRepo;//==
  // HomeBloc(this._homeStatusRepo):super(UpdatingState())
  // {
  //   on<UpdatingDataEvent>((event, emit)async
  //   {
  //     emit(UpdatingState());
  //     try
  //     {
  //       final status=await _homeStatusRepo.getStatus();
  //       if (kDebugMode) 
  //       {
  //         print('Data fetched successfully');
  //       }
  //       emit(UpdatedState(status));
  //     }
  //     catch(error)
  //     {
  //       if (kDebugMode) 
  //       {
  //         print('Error occurred:$error');
  //       }
  //       emit(ErrorState(error.toString()));
  //     }
  //   });
  // } 