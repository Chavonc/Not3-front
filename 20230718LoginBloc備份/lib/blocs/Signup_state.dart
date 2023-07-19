import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable 
{
  const SignUpState();
  @override
  List<Object?> get props => [];
  get account => null;
  get firstname => null;
  get lastname => null;
  get password => null;
}
class InitialState extends SignUpState{}
class CheckSignUpInputState extends SignUpState//格式正確
{
  final bool isValid;
  const CheckSignUpInputState(this.isValid);
  @override
  List<Object?>get props=>[isValid];
}
class GoLoginState extends SignUpState{}//早已註冊
class SignUpInputDataState extends SignUpState//使用者已輸入資料
{
  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final String account;
  @override
  final String password;
  const SignUpInputDataState(this.firstname,this.lastname,this.account, this.password);
  @override
  List<Object?>get props=>[firstname,lastname,account,password];
}
class SignUpErrorState extends SignUpState{}