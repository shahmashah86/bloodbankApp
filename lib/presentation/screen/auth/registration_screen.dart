import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/presentation/bloc/auth/auth_bloc.dart';

import 'package:project1/presentation/screen/home/Homescreen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
     TextEditingController usernameController=TextEditingController();
      TextEditingController passwordController=TextEditingController();
         TextEditingController emailController=TextEditingController();
      final  regForm_key=GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 40),
        child: Form(key:regForm_key,
          child: Column(
                 
                  children: [
          Text(
            "create an account",
            style: TextStyle(
                fontSize: 23,
                color: Colors.red.shade900,
                fontWeight: FontWeight.w500),
          ),SizedBox(height: 10,),
          TextFormField(obscureText: true,controller: usernameController,
                validator: (value){ 
                
                if(value==null||value==''){
                  return "empty username field";
          
                }if(value.length<8){
                  return "invalid length for username";
                }
                },
                decoration: InputDecoration(hintText: "Username",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red.shade900)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red.shade900))),
              ),SizedBox(height: 10,),
                   TextFormField(controller: emailController,
                    validator: (value){ 
                      final RegExp emailRegex=RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                if(value==null||value==''){
                  return "empty  email field";
          
                }if(value.length<8){
                  return "invalid length  email";

                }

                if(!emailRegex.hasMatch(value)){
                  return 'Enter a valid email';
                }
                return null;
                },
                decoration: InputDecoration(hintText: "email",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red.shade900)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red.shade900))),
              ),
              SizedBox(height: 20,),
              TextFormField(obscureText: true,controller: passwordController,
                validator: (value){ 
                
                if(value==null||value==''){
                  return "empty password field";
          
                }if(value.length<8){
                  return "invalid length for password";
                }
                },
                decoration: InputDecoration(hintText: "Password",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red.shade900)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red.shade900))),
              ),
                 SizedBox(
                height: 40,
              ),
              TextButton(
                onPressed: () async{
                 if(regForm_key.currentState!.validate()) {
                  // UserCredential userdata= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
                  // if(userdata!=null){
                  //   FirebaseFirestore.instance.collection('users').doc(userdata.user!.uid).set({'uid':userdata.user!.uid,
                  //   'email':userdata.user!.email,
                  //   'name':usernameController.text.trim(),
                  //   'createdtime':DateTime.now(),
                  //   'status':1}).then((value)=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                  //     return Homescreen();
                  //   }), (route)=>false));

                  // }


                     try {
                            context.read<AuthBloc>().add(AuthCreateAccount(
                                email: emailController.text.trim(), password: passwordController.text.trim()));
                          } catch (e) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(e.toString())));
                            });
                          }


                  }
                },
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.red.shade900),
                    shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero))),
                child: Center(child: Text("Register", style: TextStyle(color: Colors.white))),
              )
                  ],
                ),
        ),
      ),
    );
  }
}
