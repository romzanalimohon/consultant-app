import 'dart:convert';

import 'package:consultancy_app/authentication_page/register.dart';
import 'package:consultancy_app/components/global_variable.dart';
import 'package:consultancy_app/main.dart';
import 'package:consultancy_app/ui_model/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wc_form_validators/wc_form_validators.dart';


int userId = 2;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var data;
  var statusCode;
  void login(String email , password) async {

    try{

      Response response = await post(
          Uri.parse('https://api.ticonsultancy.co.uk/api/login'),
          body: {
            'email' : email,
            'password' : password
          }
      );

      if(response.statusCode == 200){

        data = jsonDecode(response.body.toString());
        print('Login successfully');
        setState(() {
          statusCode = 1;
        });
        print(statusCode);
        print(data['student']['email']);
        print(data['student']['password']);
        print(data);

      }else {
        setState(() {
          statusCode = 0;
        });
        print(statusCode);
        print('failed');
      }
    }catch(e){
      print(e.toString());
    }
  }

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const SizedBox(height: 50),



                  const SizedBox(height: 25),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        prefixIcon: Icon(Icons.email),
                      ),

                      validator: Validators.compose([
                        Validators.required('email is required'),
                        Validators.email('invalid email address'),
                      ]),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // password textfield
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: 'password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'password required';
                        }
                      },
                    ),
                  ),

                  const SizedBox(height: 25),

                  GestureDetector(
                    onTap: () async{
                      if (_formkey.currentState!.validate()) {
                        if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
                            if(statusCode == 1){
                              var sharedPref = await SharedPreferences.getInstance();
                              sharedPref.setBool(MySplashAppState.KEYLOGIN, true);
                              login(emailController.text.toString(), passwordController.text.toString());
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
                            }
                        }
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 330,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text('Login', style: TextStyle(fontSize: 25),)),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // or continue with
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()));
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 330,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text('Register', style: TextStyle(fontSize: 25, color: Colors.black),)),
                    ),
                  ),


                  const SizedBox(height: 20),

                  // forgot password?
                  Center(
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),

                  const SizedBox(height: 50),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}