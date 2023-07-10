import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable 
{
  const LoginState();
  @override
  List<Object?> get props => [];
}
class InitState extends LoginState{}
class CheckInputState extends LoginState//格式是否正確
{
  final bool isValid;
  const CheckInputState(this.isValid);
  @override
  List<Object?>get props=>[isValid];

}
class GoSignUpState extends LoginState{}//沒註冊
class InputDataState extends LoginState//使用者已輸入資料
{
  final String account;
  final String password;
  const InputDataState(this.account,this.password);
  @override
  List<Object?>get props=>[account,password];
}
class ErrorState extends LoginState{}