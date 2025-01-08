import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/presentation/bloc/auth/auth_bloc.dart';
import 'package:project1/presentation/bloc/doner/doner_bloc.dart';
import 'package:project1/presentation/screen/auth/login_screen.dart';
import 'package:project1/presentation/screen/doner/addNewdoner_screen.dart';
import 'package:project1/presentation/screen/doner/getAdoner_screen.dart';
import 'package:project1/presentation/screen/home/widget/content_widget.dart';

class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<DonerBloc>().add(DonerGetAll());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: Colors.red.shade900,
      ),
      drawer: Drawer(
          width: 260,
          child: ListView(
            children: [
              DrawerHeader(
                // margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                child: Container(
                  color: Colors.red.shade900,
                  child: BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSignOutSuccess) {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }), (route) => false);
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthSuccess) {
                        final auth = state.authModel;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              auth.userName ?? "User",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              auth.email ?? "",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        );
                      }
                      return Text("loading");
                    },
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Homescreen();
                  }));
                },
                child: ListTile(
                  title: Text(
                    "Home",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
              ),
           
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AddnewdonerScreen();
                  }));
                },
                child: ListTile(
                  title: Text(
                    "Add doner",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
              ),
              Divider(),
              InkWell(
                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return GetAdonerScreen();
                  }));
                },
                child: ListTile(
                  title: Text(
                    "Get doner",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  context.read<AuthBloc>().add(AuthSignOut());
                },
                child: ListTile(
                  title: Text(
                    "Logout",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
              ),
              Divider(),
            ],
          )),
      body: Stack(
        children: [
          Container(
            height: 160,
            width: double.infinity,
            color: Colors.red.shade900,
          ),
          Column(
            children: [
              SizedBox(
                height: 92,
              ),
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: ContentWidget()),
                    Positioned(
                      top: -80,
                      left: MediaQuery.sizeOf(context).width * 0.35,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                            'C:/FLUTTER/Firebase/firebase_persondetails/assets/images/person.jpg'),
                        radius: 55,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
