import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/foundation.dart';
import '../models/LoginModel.dart';

class LoginStatusRepository
{
  String homeUrl = 'https://reqres.in/api/users?page=2';

  Future<List<LoginModel>> getStatus() async 
  {
    try
    {
      Response response = await get(Uri.parse(homeUrl));
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
