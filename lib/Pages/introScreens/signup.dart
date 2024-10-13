import 'dart:convert';

import 'package:event_management/Pages/userScreens/HomePage.dart';
import 'package:event_management/Pages/introScreens/login.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final username = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();
  final contact = TextEditingController();
  final role = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1efe7),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ListTile(
                    title: Text(
                      "Create Account",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),

                  Image.asset(
                    "assets/Logo.png",
                    height: 250,
                  ),

                  Container(
                    margin: EdgeInsets.all(8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff5E6E58),width: 1),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        // border: Border.all(color: Color(0xff5E6E58),width: 3)
                    ),
                    child: TextFormField(
                      style: TextStyle(color: Color(0xff5E6E58)),
                      controller: username,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "username is required";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Color(0xff5E6E58),
                        ),
                        border: InputBorder.none,
                        hintText: "Username",
                        hintStyle: TextStyle(color: Color(0xff5E6E58)),
                      ),
                    ),
                  ),

                  //Password field
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff5E6E58),width: 1),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: TextFormField(
                      style: TextStyle(color: Color(0xff5E6E58)),
                      controller: password,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password is required";
                        }
                        return null;
                      },
                      obscureText: !isVisible,
                      decoration: InputDecoration(
                          icon: const Icon(
                            Icons.lock,
                            color: Color(0xff5E6E58),
                          ),
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: TextStyle(color: Color(0xff5E6E58)),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  //toggle button
                                  isVisible = !isVisible;
                                });
                              },
                              icon: Icon(isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                                  color: Color(0xff5E6E58),  
                                )),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff5E6E58),width: 1),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white
                    ),
                    child: TextFormField(
                      style: TextStyle(color: Color(0xff5E6E58)),
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is required";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Color(0xff5E6E58),
                        ),
                        border: InputBorder.none,
                        hintText: "Email",
                        hintStyle: TextStyle(color: Color(0xff5E6E58)),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff5E6E58),width: 1),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white
                    ),
                    child: TextFormField(
                      style: TextStyle(color: Color(0xff5E6E58)),
                      controller: contact,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Contact is required";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.phone,
                          color: Color(0xff5E6E58),
                        ),
                        border: InputBorder.none,
                        hintText: "Contact",
                        hintStyle: TextStyle(color: Color(0xff5E6E58)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  //Login button
                  Container(
                    height: 50,
                    width: 450,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xff5E6E58)),
                    child: TextButton(
                        onPressed: () async{
                          if(formKey.currentState!.validate()){
                            print("Success");
                            String name = username.text;
                            String pass = password.text;
                            String phone = contact.text;
                            String mail = email.text;
                            // const url = "https://onech-backend-1.onrender.com/users/signup";
                            // var res = await signUp(url,name,mail,pass,phone);
                            // var decode = jsonDecode(res);
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
                            username.clear();
                            password.clear();
                            email.clear();
                            contact.clear();
                          }
                        },
                        child: const Text(
                          "SIGN UP",
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                  ),

                  SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Colors.black
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
                          },
                          child: const Text("Login"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}