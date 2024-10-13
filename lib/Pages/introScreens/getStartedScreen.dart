import 'package:event_management/Pages/introScreens/login.dart';
import 'package:event_management/Pages/introScreens/signup.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1efe7),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 80,),
          Container(
              child: Image.asset("assets/Getting_Started.png")
            ),
            SizedBox(height: 20,),
            Text(
              "Get Started with Happening !",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "Welcome to Happening, your go-to event management platform! Whether you're organizing events or attending them, we make it easy.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                )
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "Never a better time to get started than now.",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30,),
            GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Signup()));
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Color(0xff5E6E58),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(
                      "Create an Account",
                      style: TextStyle(
                        color: Color(0xfff1efe7),
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff5E6E58),width: 2),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(
                      "Sign in to your Account",
                      style: TextStyle(
                        color: Color(0xff5E6E58),
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ),
              ),
        ],
      ),
    );
  }
}