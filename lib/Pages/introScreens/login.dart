import 'package:event_management/Pages/userScreens/HomePage.dart';
import 'package:event_management/Pages/introScreens/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final formKey = GlobalKey<FormState>();

  final username = TextEditingController();
  final password = TextEditingController();

  bool isVisible = false;

  late SharedPreferences pref;

  String errorMessage = "";
  bool isError = false;

  @override
  void initState() {
    super.initState();
    initpref();
  }

  void initpref() async{
    pref = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1efe7),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const ListTile(
                    title: Text(
                      "Welcome Back !",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  Image.asset(
                    "assets/Logo.png",
                    width: 250,
                  ),
                  const SizedBox(height: 15),
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
                      keyboardType: TextInputType.text,
                      controller: username,
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
                        hintStyle: TextStyle(color: Color(0xff5E6E58))
                      ),
                    ),
                  ),

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
                                //In here we will create a click to show and hide the password a toggle button
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

                  const SizedBox(height: 10),

                  GestureDetector(
                    onTap: () async {
                          if(formKey.currentState!.validate()){
                            print("Success");
                          }
                          String name = username.text;
                          String pass = password.text;
                          print(name);
                          print(pass);
                          // const url = "https://onech-backend-1.onrender.com/users/login";
                          // var res = await login(url,name,pass);
                          // var decode = jsonDecode(res);
                          // print(decode["message"]["token"]);
                          // if(!decode['error']){
                          //   setState(() {
                          //     isError = false;
                          //   });
                          //   String myToken = decode["message"]["token"];
                          //   pref.setString('token', myToken);
                          //   Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(builder: (context)=>Home(token: decode["message"]["token"]))
                          //   );
                          // }
                          // else{
                          //   setState(() {
                          //     isError = true;
                          //     errorMessage = decode["message"];
                          //   });
                          // }
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
                          username.clear();
                          password.clear();
                        },
                    child: Container(
                      height: 55,
                      width: 450,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xff5E6E58)),
                        child: Center(
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.black
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Signup()));
                          },
                          child: const Text("SIGN UP")
                        ),
                    ],
                  ),
                  isError ? Container(child: Text(errorMessage,style: TextStyle(color: Colors.red),),) : Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}