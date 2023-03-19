import 'package:flutter/material.dart';
import 'HomePage.dart';
void main() {runApp(const MyApp());}
class MyApp extends StatelessWidget 
{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) 
  {
    return const MaterialApp
    (
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

class Login extends StatefulWidget 
{
  const Login({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> 
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      backgroundColor: Colors.white,
      appBar: AppBar
      (
        title: const Text("Login Page"),
      ),
      body: SingleChildScrollView
      (
        child: Column
        (
          children: <Widget>
          [
            Padding
            (
              padding: const EdgeInsets.only(top: 60.0),
              child: Center
              (
                child: SizedBox
                (
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('images/logo_test.png')),
              ),
            ),
            const Padding
            (
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField
              (
                decoration: InputDecoration
                (
                  border: OutlineInputBorder(),
                  labelText: 'Account',
                  hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            const Padding
            (
              padding: EdgeInsets.only
              (
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField
              (
                obscureText: true,
                decoration: InputDecoration
                (
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'
                ),
              ),
            ),
            TextButton
            (
              onPressed: ()
              {
                // ignore: todo
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: const Text
              (
                'Forgot Password?',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container
            (
              height: 50,
              width: 250,
              decoration: BoxDecoration
              (
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton
              (
                onPressed: () 
                {
                  Navigator.push
                  (
                      context, MaterialPageRoute(builder: (_) => const HomePage()));
                },
                child: const Text
                (
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox
            (
              height: 130,
            ),
            const Text('New User? Create Account')
          ],
        ),
      ),
    );
  }
}