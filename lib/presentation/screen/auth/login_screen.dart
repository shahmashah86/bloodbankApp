import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';




class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: "Username",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red.shade900)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red.shade900))),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
                decoration: InputDecoration(hintText: "Password",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red.shade900)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red.shade900)))),
            SizedBox(
              height: 50,
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red.shade900),
                  shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero))),
              child: Center(child: Text("Login", style: TextStyle(color: Colors.white))),
            ),
             SizedBox(
              height: 20,
            ),

            InkWell(child: Text("Not a member?Sign up",style: TextStyle(fontSize:15),),onTap: (){},),
             SizedBox(
              height: 40,
            ),
       
          ],
        ),
      ),
    );
  }

}