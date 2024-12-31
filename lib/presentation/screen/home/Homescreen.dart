import 'package:flutter/material.dart';
import 'package:project1/domain/model/donerDetails.dart';
import 'package:project1/model/save_edit_buttonmodel.dart';
import 'package:project1/package/firebase/firebase_service.dart';
import 'package:project1/presentation/screen/doner/addNewdoner_screen.dart';
import 'package:project1/presentation/screen/doner/getAdoner_screen.dart';
import 'package:project1/presentation/screen/auth/login_screen.dart';

class Homescreen extends StatelessWidget {
  String? selectedGroup;
  Homescreen({this.selectedGroup, super.key});

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Shahma",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      "Shahhha@44gmail.com",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Homescreen(
                    selectedGroup: null,
                  );
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginScreen(
                    
                  );
                }));
              },
              

              child: ListTile(
                title: Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
            ),
            InkWell(
              onTap: () {
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Homescreen(
                    selectedGroup: null,
                  );
                }));
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
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 160,
            width: double.infinity,
            color: Colors.red.shade900,
           
          ),
          
          content(selectedGroup: selectedGroup),
        ],
      ),
    );
  }
}

class content extends StatelessWidget {
  const content({
    super.key,
    required this.selectedGroup,
  });

  final String? selectedGroup;

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      SizedBox(height: 92,),
      Expanded(
        child: Stack(
          clipBehavior: Clip.none,
          children: [ Container(
            decoration: BoxDecoration(color:Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: StreamBuilder(
              stream: FirebaseService()
                  .firestore
                  .collection(FirebaseService().collectionName)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Something went wrong"));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text("No data available"));
                }
                if (selectedGroup != null) {
                  List<Donerdetails> documents = [];
                  final data = snapshot.data!.docs;
          
                  List<Donerdetails> datas = (data)
                      .map(
                          (document) => Donerdetails.fromMap(document.data()))
                      .toList();
                  for (Donerdetails i in datas) {
                    if (i.bloodGroup == selectedGroup) {
                      documents.add(i);
                    }
                  }
          
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(padding: EdgeInsets.only(left: 10,right: 10,top: 30),
                            itemBuilder: (context, index) {
                              final documentsdata = documents[index];
                                        
                              return SizedBox(
                                  width: double.infinity,
                                  height: 100,
                                  child: Card(
                                      color: Colors.red.shade100,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.bloodtype_rounded,
                                            size: 60,
                                            color: Colors.red.shade900,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                documentsdata.name,
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              Text(documentsdata.mobNo,
                                                  style: TextStyle(fontSize: 15)),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 40,
                                          ),
                                          Text(
                                            documentsdata.bloodGroup,
                                            style: TextStyle(fontSize: 30),
                                          ),
                                          Spacer(),
                                          IconButton(
                                            onPressed: () {
                                              final donerdetailsToUpdate =
                                                  Donerdetails(
                                                      name: datas[index].name,
                                                      age: datas[index].age,
                                                      bloodGroup:
                                                          datas[index].bloodGroup,
                                                      mobNo: datas[index].mobNo);
                                              SaveButtonMode mode =
                                                  SaveButtonMode.edit;
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return AddnewdonerScreen(
                                                    donerdetailsToUpdated:
                                                        donerdetailsToUpdate,
                                                    buttonMode: mode,
                                                    docIdToUpdate: data[index].id);
                                              }));
                                            },
                                            icon: Icon(Icons.edit),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              String documentTodelete =
                                                  data[index].id;
                                              FirebaseService()
                                                  .deleteDetails(documentTodelete);
                                            },
                                            icon: Icon(Icons.delete),
                                          )
                                        ],
                                      )));
                            },
                            itemCount: documents.length),
                      ),
                    ],
                  );
                }
                final data = snapshot.data!.docs;
          
                List<Donerdetails> datas = (data)
                    .map((document) => Donerdetails.fromMap(document.data()))
                    .toList();
                return ListView.builder(padding: EdgeInsets.only(left: 10,right: 10,top: 30),
                  itemBuilder: (context, index) {
                    final document = datas[index];
                                
                    return SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: Card(
                            color: Colors.red.shade100,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.bloodtype_rounded,
                                  size: 60,
                                  color: Colors.red.shade900,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      document.name,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(document.mobNo,
                                        style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  document.bloodGroup,
                                  style: TextStyle(fontSize: 30),
                                ),
                                SizedBox(width: 20,),
                                Spacer(),
                                IconButton(
                                  onPressed: () {
                                    final donerdetailsToUpdate = Donerdetails(
                                        name: datas[index].name,
                                        age: datas[index].age,
                                        bloodGroup: datas[index].bloodGroup,
                                        mobNo: datas[index].mobNo);
                                    SaveButtonMode mode = SaveButtonMode.edit;
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return AddnewdonerScreen(
                                          donerdetailsToUpdated:
                                              donerdetailsToUpdate,
                                          buttonMode: mode,
                                          docIdToUpdate: data[index].id);
                                    }));
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {
                                    String documentTodelete = data[index].id;
                                    FirebaseService()
                                        .deleteDetails(documentTodelete);
                                  },
                                  icon: Icon(Icons.delete),
                                )
                              ],
                            )));
                  },
                  itemCount: datas.length,
                );
              },
            ),
          ), Positioned(top: -80,left: MediaQuery.sizeOf(context).width*0.35,
       child: CircleAvatar(backgroundImage: AssetImage('C:/FLUTTER/Firebase/firebase_persondetails/assets/images/person.jpg'),
          radius: 55,
        ),
     ),],),
      ),
    ],
                );
  }
}
