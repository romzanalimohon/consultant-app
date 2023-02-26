import 'dart:convert';
import 'dart:io';

import 'package:consultancy_app/components/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wc_form_validators/wc_form_validators.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password_confirmationController = TextEditingController();

  Future<void> submitData() async{
    final name = nameController.text;
    final email = emailController.text;
    final mobile = mobileController.text;
    final password = passwordController.text;
    final password_confirmation = password_confirmationController.text;

      final body = {
        "name": name,
        "email": email,
        "mobile": mobile,
        "password": password,
        "password_confirmation": password_confirmation
      };
      //submit data to the server
      final url = '$api/registration';
      final uri = Uri.parse(url);
      final response = await http.post(uri,
          body: jsonEncode(body),
          headers: {'Content-Type': 'application/json'}
      );
      if(response.statusCode == 200){
        // usernameController.text = '';
        // passwordController.text = '';
        print('creation success');
        print('uploaded');
        showSuccessMessage("Registration success");
      }else{
        print('creation failed');
        showErrorMessage("Registration Failed");
        //print(response.body);
      }
      print(response.body);
  }

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Create an account'),),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Form(
            key: _formkey,
            child: Stack(
              children: [
                Positioned(
                    top: 10.0,
                    left: 15,
                    child: Text('Registration Info', style: TextStyle(fontSize: 20, color: Colors.black),),
                ),
                Positioned(
                  top: 17,
                  left: 15,
                  child: Text('__________________________________________', style: TextStyle(fontSize: 20, color: Colors.black),),
                ),
                Positioned(
                  top: 50,
                  left: 15,
                  child: Text('Name', style: TextStyle(fontSize: 13, color: Colors.black),),),
                Positioned(
                    top: 65,
                    //left: 15,
                    child: ConstrainedBox(
                  constraints: BoxConstraints.expand(height: 200, width: size.width*.95),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 2),
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          labelText: '',
                          border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person)
                        //prefixIcon: Icon(Icons.email),
                      ),
                      validator: Validators.compose([
                        Validators.required('name is required'),
                        //Validators.email('invalid email address'),
                      ]),
                    ),
                  ),
                )),




                Positioned(
                  top: 158,
                  left: 15,
                  child: Text('Email', style: TextStyle(fontSize: 13, color: Colors.black),),),
                Positioned(
                    top: 173,
                    left: 0,
                    child: ConstrainedBox(
                      constraints: BoxConstraints.expand(height: 200, width: size.width*.95),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 2),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              labelText: '',
                              border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                          ),
                          validator: Validators.compose([
                            Validators.required('email is required'),
                            Validators.email('invalid email address'),
                          ]),
                        ),
                      ),
                    )),








                Positioned(
                  top: 258,
                  left: 15,
                  child: Text('Mobile No', style: TextStyle(fontSize: 13, color: Colors.black),),),
                Positioned(
                    top: 273,
                    left: 0,
                    child: ConstrainedBox(
                      constraints: BoxConstraints.expand(height: 200, width: size.width*.95),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 2),
                        child: TextFormField(
                          controller: mobileController,
                          decoration: InputDecoration(
                              labelText: '',
                              border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.phone)
                          ),
                          validator: Validators.compose([
                            Validators.required('phone number is required'),
                          ]),
                        ),
                      ),
                    )),


                Positioned(
                  top: 363,
                  left: 15,
                  child: Text('password', style: TextStyle(fontSize: 13, color: Colors.black),),),
                Positioned(
                    top: 383,
                    //left: 15,
                    child: ConstrainedBox(
                      constraints: BoxConstraints.expand(height: 200, width: size.width*.95),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 2),
                        child: TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                              labelText: '',
                              border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock)
                          ),
                          validator: Validators.compose([
                            Validators.required('password confirmation is required'),
                          ]),
                        ),
                      ),
                    )),

                Positioned(
                  top: 478,
                  left: 15,
                  child: Text('confirm_password', style: TextStyle(fontSize: 13, color: Colors.black),),),
                Positioned(
                    top: 498,
                    //left: 15,
                    child: ConstrainedBox(
                      constraints: BoxConstraints.expand(height: 200, width: size.width*.95),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 2),
                        child: TextFormField(
                          controller: password_confirmationController,
                          decoration: InputDecoration(
                              labelText: '',
                              border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock)
                          ),
                          validator: Validators.compose([
                            Validators.required('password is required'),
                          ]),
                        ),
                      ),
                    )),






                // Positioned(
                //   top: 830,
                //   left: 20,
                //   child: GestureDetector(
                //     onTap: (){
                //       submitData();
                //     },
                //     child: Container(
                //       height: 50,
                //       width: 370,
                //       decoration: BoxDecoration(
                //       color: Colors.blue,
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     child: Center(child: Text('Register', style: TextStyle(fontSize: 25, color: Colors.black),)),
                // ),
                //   ),)

                Positioned(
                  top: 580,
                  left: 20,
                  child: ElevatedButton(
                    child: Text('register'),
                    onPressed: (){
                      if(_formkey.currentState!.validate()){
                        if(nameController.text.isNotEmpty && emailController.text.isNotEmpty
                            && mobileController.text.isNotEmpty && passwordController.text.isNotEmpty
                            && password_confirmationController.text.isNotEmpty){
                          submitData();
                        }
                      }
                    },
                  ),
                )


                // Column(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(left: 15.0, top: 10),
                //       child: Text('About you', style: TextStyle(fontSize: 20, color: Colors.black),),
                //     ),
                //     const Divider(
                //       height: 10,
                //       thickness: 2,
                //       indent: 20,
                //       endIndent: 10,
                //       color: Colors.black,
                //     ),
                //   ],
                // ),
                //
                // Positioned(
                //   top: 50,
                //   child: Text('First Name', style: TextStyle(fontSize: 13, color: Colors.black),),)
              ],
            ),
          ),
        )
      ),
    );
  }


  void showSuccessMessage(String message){
    final snackBar = SnackBar(content: Text(message),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  void showErrorMessage(String message){
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


}
