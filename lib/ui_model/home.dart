import 'dart:convert';

import 'package:consultancy_app/authentication_page/login.dart';
import 'package:consultancy_app/components/app_bar.dart';
import 'package:consultancy_app/components/global_variable.dart';
import 'package:consultancy_app/ui_model/doctor_list.dart';
import 'package:consultancy_app/ui_model/profile.dart';
import 'package:consultancy_app/ui_model/settings.dart';
import 'package:consultancy_app/ui_model/status.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  //var userId;

  // void login(String email , password) async {
  //
  //   try{
  //
  //     Response response = await post(
  //         Uri.parse('https://consultant.xprtx.net/public/api/auth/login'),
  //         body: {
  //           'email' : email,
  //           'password' : password
  //         }
  //     );
  //
  //     if(response.statusCode == 200){
  //
  //       var data = jsonDecode(response.body.toString());
  //       // setState(() {
  //       //   userId = data['student']['id'];
  //       // });
  //       // print(userId);
  //       print('Login successfully');
  //
  //     }else {
  //       print('failed');
  //     }
  //   }catch(e){
  //     print(e.toString());
  //   }
  // }



  int _currentIndex = 2;
  final tabs = [
    DoctorList(),
    Status(),
    Profile(user: userId,),
    Settings(),

  ];

  final app_bar = [
    DoctorAppBar(),
    StatusAppBar(),
    ProfileAppBar(),
    SettingsAppBar()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: app_bar[_currentIndex],
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          //type: BottomNavigationBarType.fixed,
          //backgroundColor: Colors.white,
          selectedItemColor: Color(0xffAA78E9),
          unselectedItemColor: Colors.orangeAccent,
          selectedFontSize: 16,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.medical_information_outlined),
                label: 'Consultant',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.signal_wifi_statusbar_4_bar),
              label: 'Status',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'profile',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'settings',
            ),
          ],

          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
            },
          //selectedItemColor: Colors.amber[800],
          //selectedIconTheme: ,
        ),
      ),
    );
  }
}
