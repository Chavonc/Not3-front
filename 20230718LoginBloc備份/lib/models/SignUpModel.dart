//API
class SignUpModel 
{
  //配合API用的list
  String? firstname;
  String? lastname;
  String? account;
  String? password;

  SignUpModel({this.firstname,this.lastname,this.account,this.password});
  SignUpModel.fromJson(Map<String, dynamic> json) 
  {
    firstname = json['first_name'];
    lastname = json['last_name'];
    account = json['email'];
    password = json['password'];
  }
}