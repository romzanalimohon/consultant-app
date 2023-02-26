import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
        children: [
          Column(

    children: [
    //Center(child: Text('Profile')),

    Expanded(
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          ListTile(
            title: Text('Date of Birth'),
            subtitle: Text('88-88-88'),
          ),
          Divider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          ListTile(
            title: Text('Cell Phone'),
            subtitle: Text('88-88-88'),
          ),
          Divider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          ListTile(
            title: Text('Home Phone'),
            subtitle: Text('88-88-88'),
          ),
          Divider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          ListTile(
            title: Text('Address'),
            subtitle: Text('dhaka\nmirpur\nmirpur'),
          ),
          Divider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),



          // Container(
          //   margin: EdgeInsets.all(20),
          //   height: 50,
          //   width: 370,
          //   decoration: BoxDecoration(
          //     color: Colors.blue,
          //     borderRadius: BorderRadius.circular(50),
          //   ),
          //   child: Center(child: Text('Edit Profile', style: TextStyle(fontSize: 25),)),
          // ),


          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 50),
            height: 50,
            width: 370,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(child: Text('Log Out', style: TextStyle(fontSize: 25),)),
          ),

        ],
      ),
    ),
    ),
    ],
    ),
          Center(child: Text('this is terms')),
          Center(child: Text('this is privacy')),
        ]);
  }
}
