//API
class LoginModel 
{
  //配合API用的list
  String? account;
  String? password;

  LoginModel({this.account, this.password});
  LoginModel.fromJson(Map<String, dynamic> json) 
  {
    account = json['email'];
    password = json['password'];
  }
}