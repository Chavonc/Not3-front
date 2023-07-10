import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable 
{
  const SignUpEvent();
  @override
  List<Object?> get props => [];
}
class SignUpButtonPressed extends SignUpEvent
{
  final String lastname;
  final String firstname;
  final String account;
  final String password;
  const SignUpButtonPressed
  (
    {
      required this.firstname,
      required this.lastname,
      required this.account,
      required this.password
    }
  );
  @override
  List<Object?> get props => [firstname,lastname,account,password];
}

