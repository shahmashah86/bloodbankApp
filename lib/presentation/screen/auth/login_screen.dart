import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/domain/auth/auth_model/auth_model.dart';
import 'package:project1/presentation/bloc/auth/auth_bloc.dart';
import 'package:project1/presentation/screen/auth/registration_screen.dart';
import 'package:project1/presentation/screen/home/Homescreen.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});
  
 

  // @override
  // class LoginPage extends StatelessWidget {
  final ValueNotifier<bool> isBannerVisible = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    final logFormkey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: logFormkey,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:20,right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      final RegExp emailRegex = RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                      if (value == null || value == '') {
                        return "Empty email field";
                      }
                      if (value.length < 8) {
                        return "Invalid length";
                      }
                      if (!emailRegex.hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Email",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red.shade900),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red.shade900),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value == '') {
                        return "Empty password field";
                      }
                      if (value.length < 8) {
                        return "Invalid password length";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red.shade900),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red.shade900),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  TextButton(
                    onPressed: () {
                      if (logFormkey.currentState!.validate()) {
                        try {
                          context.read<AuthBloc>().add(AuthSigninWithEmail(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim()));
                              log(emailController.text.trim(),name: "Emal");
                        } catch (e) {
                          // Handle exceptions
                        }
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.red.shade900),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                      ),
                    ),
                    child: Center(
                      child:
                          Text("Login", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    child: Text(
                      "Not a member? Sign up",
                      style: TextStyle(fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RegistrationScreen();
                      }));
                    },
                  ),
                  SizedBox(height: 40),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccess) {
                        log("succes");
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) {
                          return Homescreen();
                        }), (route) => false);
                      }
                      if (state is AuthError) {
                        isBannerVisible.value = true;
                        log("errror");
                        String message =
                            state.errormsg ?? "An unknown error occurred";
                        if (message.contains(
                            'The supplied auth credential is incorrect, malformed or has expired.')) {
                          message = "Incorrect username or password";
                        } 
                        else if (message.contains(
                            'The email address is already in use by another account.')) {
                          message = "email address is already in use";
                        } 
                        
                        else {
                          message =
                              "Something went wrong. Please try again later.";
                        }
                        ScaffoldMessenger.of(context).showMaterialBanner(
                          MaterialBanner(
                            backgroundColor: Colors.red.shade300,
                            leading: const Icon(
                              Icons.info,
                              size: 32,
                            ),
                            content: Text(
                              message,
                              style: TextStyle(fontSize: 13),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  emailController.clear();
                                  passwordController.clear();
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentMaterialBanner();
                                  isBannerVisible.value = false; // Reset visibility
                                },
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        );
                    
                         // Show banner
                      }
                    },
                    builder: (context, state) {
                      return SignInButton(
                        Buttons.google,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        onPressed: () {
                          context.read<AuthBloc>().add(AuthSignin());
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            // Using ValueListenableBuilder for dynamic updates
            ValueListenableBuilder<bool>(
              valueListenable: isBannerVisible,
              builder: (context, value, child) {
                if (value==true) {
                  return ModalBarrier(
                    color: Colors.black.withOpacity(0.2),
                    dismissible: false,
                  );
                }
                return SizedBox.shrink(); // Empty widget when not visible
              },
            ),
          ],
        ),
      ),
    );
  }
}

  // Widget build(BuildContext context) {
  //   bool isbannervisible=false;
  //   TextEditingController passwordController = TextEditingController();
  //   TextEditingController emailController = TextEditingController();
  //   final logFormkey = GlobalKey<FormState>();
  //   return Scaffold(
  //       appBar: AppBar(),
  //       body: Padding(
  //         padding: EdgeInsets.only(
  //           left: 20,
  //           right: 20,
  //         ),
  //         child: Form(
  //           key: logFormkey,
  //           child:
  //               Stack(
  //                 children: [ 
  //                   Column(mainAxisAlignment: MainAxisAlignment.center, children: [
  //                               TextFormField(
  //                 controller: emailController,
  //                 validator: (value) {
  //                   final RegExp emailRegex = RegExp(
  //                       r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                  
  //                   if (value == null || value == '') {
  //                     return "empty email field";
  //                   }
  //                   if (value.length < 8) {
  //                     return "invalid length";
  //                   }
  //                   if (!emailRegex.hasMatch(value)) {
  //                     return 'Enter a valid email';
  //                   }
  //                   return null;
  //                 },
  //                 decoration: InputDecoration(
  //                     hintText: "email",
  //                     enabledBorder: OutlineInputBorder(
  //                         borderSide: BorderSide(color: Colors.red.shade900)),
  //                     focusedBorder: OutlineInputBorder(
  //                         borderSide: BorderSide(color: Colors.red.shade900))),
  //                               ),
  //                               SizedBox(
  //                 height: 40,
  //                               ),
  //                               TextFormField(
  //                   controller: passwordController,
  //                   validator: (value) {
  //                     if (value == null || value == '') {
  //                       return "empty passwordfeild field";
  //                     }
  //                     if (value.length < 8) {
  //                       return "invalid password length";
  //                     }
  //                     return null;
  //                   },
  //                   obscureText: true,
  //                   decoration: InputDecoration(
  //                       hintText: "Password",
  //                       enabledBorder: OutlineInputBorder(
  //                           borderSide: BorderSide(color: Colors.red.shade900)),
  //                       focusedBorder: OutlineInputBorder(
  //                           borderSide: BorderSide(color: Colors.red.shade900)))),
  //                               SizedBox(
  //                 height: 50,
  //                               ),
  //                               TextButton(
  //                 onPressed: () {
  //                   if (logFormkey.currentState!.validate()) {
  //                     try {
  //                       context.read<AuthBloc>().add(AuthSigninWithEmail(
  //                           email: emailController.text.trim(),
  //                           password: passwordController.text.trim()));
  //                     } catch (e) {
  //                       /////////////////////////////////////
  //                       // WidgetsBinding.instance.addPostFrameCallback((_) {
  //                       //   ScaffoldMessenger.of(context).showSnackBar(
  //                       //       SnackBar(content: Text(e.toString())));
  //                       // });
  //                       //                                              ScaffoldMessenger.of(context).showSnackBar(
  //                       // SnackBar(content: Text(e.toString())),
  //                       // );
  //                     }
  //                   }
  //                 },
  //                 style: ButtonStyle(
  //                     backgroundColor:
  //                         WidgetStatePropertyAll(Colors.red.shade900),
  //                     shape: WidgetStatePropertyAll(RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.zero))),
  //                 child: Center(
  //                     child:
  //                         Text("Login", style: TextStyle(color: Colors.white))),
  //                               ),
  //                               SizedBox(
  //                 height: 20,
  //                               ),
  //                               InkWell(
  //                 child: Text(
  //                   "Not a member?Sign up",
  //                   style: TextStyle(fontSize: 15),
  //                 ),
  //                 onTap: () {
  //                   Navigator.push(context, MaterialPageRoute(builder: (context) {
  //                     return RegistrationScreen();
  //                   }));
  //                 },
  //                               ),
  //                               SizedBox(
  //                 height: 40,
  //                               ),
  //                               BlocConsumer<AuthBloc, AuthState>(
  //                 listener: (context, state) {
  //                   log("llll");
  //                   // TODO: implement listener
  //                   if (state is AuthSuccess) {
  //                     log("Authsucces state");
  //                     AuthModel model = state.authModel;
  //                     log(model.toString(), name: "User Details");
                  
  //                     Navigator.pushAndRemoveUntil(context,
  //                         MaterialPageRoute(builder: (context) {
  //                       return Homescreen();
  //                     }), (route) => false);
  //                   }
  //                   if (state is AuthError) {
                      
  //                     String message =
  //                         state.errormsg ?? "An unknown error occurred";
  //                     if (message.contains(
  //                         ' The supplied auth credential is incorrect, malformed or has expired.')) {
  //                       message = "incorrect username or password";
  //                     } else {
  //                       message = "Something went wrong. Please try again later.";
  //                     }
  //                     log("Autherror state");
  //                     ScaffoldMessenger.of(context).showMaterialBanner(
  //                       MaterialBanner(
                        
  //                           backgroundColor: Colors.red.shade300,
  //                           // padding: EdgeInsets.only(right: 15),
                  
  //                           //  leadingPadding: const EdgeInsets.only(right: 30),
  //                           leading: const Icon(
  //                             Icons.info,
  //                             size: 32,
  //                           ),
  //                           content: Text(
  //                             message,
  //                             style: TextStyle(fontSize: 13),
  //                           ),
  //                           actions: [
  //                             TextButton(
  //                                 onPressed: () {
  //                                   emailController.clear();
  //                                   passwordController.clear();
  //                                     isbannervisible=false;
  //                                   return ScaffoldMessenger.of(context)
  //                                       .hideCurrentMaterialBanner();
                                        
  //                                 },
  //                                 child: const Text('Retry')),
  //                           ]),
                            
  //                     );
  //                     isbannervisible=true;
  //                   }
  //                 },
  //                 builder: (context, state) {
  //                   return SignInButton(
  //                     Buttons.google,
  //                     shape: RoundedRectangleBorder(
  //                       side: const BorderSide(color: Colors.black12),
  //                       borderRadius: BorderRadius.circular(8),
  //                     ),
  //                     onPressed: () {
  //                       context.read<AuthBloc>().add(AuthSignin());
  //                     },
  //                   );
  //                 },
  //                               ),
  //                             ]),]
  //               ),
  //         ),
  //       ));
  // }
