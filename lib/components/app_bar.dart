import 'package:consultancy_app/components/text_stile.dart';
import 'package:flutter/material.dart';

AppBar DoctorAppBar(){
  return AppBar(
    title: Center(child: Text('Consultant', style: appBarStyle())),
    backgroundColor: Colors.white54,
  );
}

AppBar StatusAppBar(){
  return AppBar(
    title: Center(child: Text('Status', style: appBarStyle())),
    backgroundColor: Colors.white54,
  );
}

AppBar ProfileAppBar(){
  return AppBar(
    title: Center(child: Text('Profile', style: appBarStyle())),
    backgroundColor: Colors.white54,
  );
}

AppBar SettingsAppBar(){
  return AppBar(
    title: Center(child: Text('Settings', style: appBarStyle())),
    centerTitle: true,
    backgroundColor: Colors.white54,
    bottom: TabBar(
      labelColor: Colors.black,
      tabs: [
        Tab(text: 'Support',),
        Tab(text: 'Terms',),
        Tab(text: 'Privacy',),
      ],
    ),
  );
}


