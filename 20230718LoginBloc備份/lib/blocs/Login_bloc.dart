import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/blocs/Login_event.dart';
import 'package:flutter_project/blocs/Login_state.dart';
import 'package:flutter_project/Repository/LoginBloc_Repo.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> 
{
  final LoginRepository _loginRepository;//套用API Model
  LoginBloc(this._loginRepository):super(LoginInitialState());//初始
  
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async*
  {
    if(event is LoginButtonPressedEvent)
    {
      yield* _mapLoginButtonPressedToState(event);
    }
    else if(event is LoginRefreshEvent)
    {
      yield LoginInitialState();
    }
  }
  //按下Button
  Stream<LoginState> _mapLoginButtonPressedToState(LoginButtonPressedEvent event)async*
  {
    try
    {
      yield LoginLoadingState();
      final response=await _loginRepository.login(event.account,event.password);
      if(response is String && response=='帳號不存在')
      {
        yield const LoginFailureState('帳號不存在');
      }
      else if(response is String && response=='帳號存在，但輸入密碼錯誤')
      {
        yield const LoginFailureState('帳號存在，但輸入密碼錯誤');
      }
      else if(response.length>=2)//Successful
      {
        final accessToken=response[0].toString();
        final ipAddress=response[1].toString();
        yield LoginSuccessState(accessToken, ipAddress);
      }
      else
      {
        yield const LoginFailureState('發生錯誤:error');
      }
    }
    catch(error)
    {
      if (kDebugMode) 
      {
        print('發生錯誤:');
        print('$error');
        yield LoginFailureState('發生錯誤:$error');
      }
      // if(error.toString().contains('Exception: Internal Server Error,500'))
      // {
      //   yield const LoginFailureState('發生內部服務器錯誤');
      // }
      // else
      // {
      //   yield LoginFailureState('發生錯誤:$error');
      // }
    }
  }
}