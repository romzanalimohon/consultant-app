import 'dart:async';

import 'package:consultancy_app/authentication_page/login.dart';
import 'package:consultancy_app/authentication_page/register.dart';
import 'package:consultancy_app/ui_model/home.dart';
import 'package:consultancy_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
      MaterialApp(
        home: MySplashApp(),
      )
  );
}

class MySplashApp extends StatefulWidget {
  const MySplashApp({Key? key}) : super(key: key);

  @override
  State<MySplashApp> createState() => MySplashAppState();
}

class MySplashAppState extends State<MySplashApp> {

  static const String KEYLOGIN = 'login';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //home: LoginPage(),
      //home: ProfileDemoPage(),
      //home: HomePage(),
      // home: RegisterPage(),
      //home: Status(),

      // initialRoute: MyRoutes.LoginRoute,
      // routes: {
      //   // MyRoutes.ProfileRoute: (context) => ProfileDemoPage(),
      //   MyRoutes.ConsultantRoute: (context) => HomePage(),
      //   MyRoutes.LoginRoute: (context) => LoginPage(),
      //   MyRoutes.RegisterRoute: (context) => RegisterPage(),
      // },

      body: Container(
        color: Colors.blue,
        child: Center(child: Icon(Icons.account_balance_rounded)),
      ),
    );
  }


  void whereToGo() async{
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 2), () {
      if(isLoggedIn != null){
        if(isLoggedIn){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
        }
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
      }
    });
  }


}