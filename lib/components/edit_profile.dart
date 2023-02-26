import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? valueschoose;
  String? valueschoose1;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: SizedBox(
          height: size.height*1.2,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                top: 10.0,
                left: 15,
                child: Text('Edit Profile', style: TextStyle(fontSize: 20, color: Colors.black),),
              ),
              Positioned(
                top: 17,
                left: 15,
                child: Text('__________________________________________', style: TextStyle(fontSize: 20, color: Colors.black),),
              ),
              Positioned(
                top: 50,
                left: 15,
                child: Text('First Name', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 70,
                  //left: 15,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: 200),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: '',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )),




              Positioned(
                top: 50,
                left: 214,
                child: Text('Last Name', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 70,
                  left: 200,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: 200),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: '',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )),




              Positioned(
                top: 150,
                left: 15,
                child: Text('Date of Birth', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 165,
                  //left: 15,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: 200),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: '',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )),




              Positioned(
                top: 150,
                left: 214,
                child: Text('Sex', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 165,
                  left: 220,
                  child: DropdownButton<String>(

                      value: this.valueschoose,
                      items: <String>['Male', 'Female'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) => setState(() => this.valueschoose = value,

                      )),),






              ///address
              Positioned(
                top: 250.0,
                left: 15,
                child: Text('Address', style: TextStyle(fontSize: 20, color: Colors.black),),
              ),
              Positioned(
                top: 257,
                left: 15,
                child: Text('__________________________________________', style: TextStyle(fontSize: 20, color: Colors.black),),
              ),
              Positioned(
                top: 300,
                left: 15,
                child: Text('Address Line 1', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 320,
                  //left: 15,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: size.width*.95),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: '',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )),

              Positioned(
                top: 410,
                left: 15,
                child: Text('Address Line 2', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 434,
                  //left: 15,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: size.width*.95),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: '',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )),



              Positioned(
                top: 520,
                left: 15,
                child: Text('City', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 535,
                  //left: 15,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: 200),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: '',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )),




              Positioned(
                top: 520,
                left: 210,
                child: Text('State', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 525,
                  left: 220,
                  child: DropdownButton<String>(

                      value: this.valueschoose,
                      items: <String>['BD', 'Japan', 'Pakistan', 'Greece'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) => setState(() => this.valueschoose = value,

                      ))),



              Positioned(
                top: 630,
                left: 15,
                child: Text('Zip Code', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 645,
                  //left: 15,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: 200),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: '',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )),

              Positioned(
                top: 730,
                left: 20,
                child: Container(
                height: 50,
                width: 370,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(child: Text('Submit', style: TextStyle(fontSize: 25, color: Colors.black),)),
              ),
              ),


            ],
          ),
        )
    );
  }
}
