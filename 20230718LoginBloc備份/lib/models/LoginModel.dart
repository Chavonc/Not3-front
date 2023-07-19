//串接API
class LoginModel 
{
  //回傳什麼就設什麼
  final String accessToken;
  final String ipAddress;
  const LoginModel({required this.accessToken, required this.ipAddress});

  factory LoginModel.fromJson(Map<String, dynamic> json) //API會給你的資料
  {
    return LoginModel
    (
      //API return
      accessToken: json['access_token'],
      ipAddress: json['ip_address'],
    );
  }
}

// class LoginModel 
// {
//   //配合API用的list
//   String? account;
//   String? password;

//   LoginModel({this.account, this.password});
//   Map<String,dynamic> toJson()
//   {
//     return
//     {
//       'account':account,
//       'password':password,
//     };
//   }
//   factory LoginModel.fromJson(Map<String, dynamic> json) 
//   {
//     return LoginModel
//     (
//       account : json['account'],
//       password : json['password'],
//     );
//   }
// }