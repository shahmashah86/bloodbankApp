import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:project1/presentation/screen/home/Homescreen.dart';

class GetAdonerScreen extends StatefulWidget {
  GetAdonerScreen({super.key});
  @override
  State<GetAdonerScreen> createState() => _GetAdonerScreenState();
}

class _GetAdonerScreenState extends State<GetAdonerScreen> {
  int km = 5;
  List<String> bloodgroups = ['A+', 'B+', 'AB+', 'A-', 'B-', 'AB-', 'O+', 'O-'];
  final ValueNotifier<int> selectedIndex = ValueNotifier(-1);

  String? selected_group;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "select the blood group",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red.shade900,
      ),
      body: Column(children: [
        Container(
          width: double.infinity,
          height: 230,
          color: Colors.red.shade900,
          child: Center(
            child: ValueListenableBuilder(
              valueListenable: selectedIndex,
              builder: (context, value, child) => GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      selectedIndex.value = index;
                      selected_group = bloodgroups[index];
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Homescreen(selectedGroup: selected_group);
                      }));
                    },
                    child: Card(
                        color: selectedIndex.value == index
                            ? Colors.red.shade100
                            : Colors.red,
                        child: Center(
                            child: Text(
                          bloodgroups[index],
                          style: TextStyle(
                              color: selectedIndex.value == index
                                  ? Colors.red.shade900
                                  : Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ))),
                  );
                },
                itemCount: bloodgroups.length,
              ),
            ),
            //   child: GridView.count(padding: EdgeInsets.all(8),
            //     crossAxisCount: 4,
            //     children: [
            //       InkWell(
            //         child: Card(
            //           color: Colors.red,
            //           child: Center(
            //               child: Text(
            //             "A+",
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 30,
            //                 fontWeight: FontWeight.w500),
            //           )),
            //         ),
            //       ),
            //       InkWell(onTap:(){
            //       selected_group="B+";
            //       Navigator.push(context, MaterialPageRoute(builder: (context){
            //         return Homescreen(selectedGroup: selected_group);
            //         }));
            //       },
            //      // focusColor: Colors.black,
            //                     //  splashColor: Colors.black,
            // // highlightColor: Colors.green,

            //         child: Card(   child: Center(
            //           child: Text(
            //               "B+",
            //               style: TextStyle(
            //                   color: Colors.red.shade800,
            //                   fontSize: 30,
            //                   fontWeight: FontWeight.w500),
            //             ),
            //         ),
            //         ),
            //       ),
            //       InkWell(

            //         child: Card(   color: Colors.red,   child: Center(
            //           child: Text(
            //               "AB+",
            //               style: TextStyle(
            //                   color: Colors.white,
            //                   fontSize: 30,
            //                   fontWeight: FontWeight.w500),
            //             ),
            //         ),
            //         ),
            //       ),
            //       Card(   color:Colors.red,   child: Center(
            //         child: Text(
            //             "A-",
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 30,
            //                 fontWeight: FontWeight.w500),
            //           ),
            //       ),
            //       ),
            //       Card(
            //         color: Colors.red,  child: Center(
            //           child: Text(
            //             "B-",
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 30,
            //                 fontWeight: FontWeight.w500),
            //           ),
            //         )
            //       ),
            //       Card(
            //         color: Colors.red,
            //            child: Center(
            //              child: Text(
            //                            "AB-",
            //                            style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 30,
            //                 fontWeight: FontWeight.w500),
            //                          ),
            //            )
            //       ),
            //       Card(   color: Colors.red, child: Center(
            //         child: Text(
            //             "O+",
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 30,
            //                 fontWeight: FontWeight.w500),
            //           ),
            //       ),
            //       ),
            //       Card(   color:Colors.red, child: Center(
            //         child: Text(
            //             "O-",
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 30,
            //                 fontWeight: FontWeight.w500),
            //           ),
            //       ),
            //       ),
            //     ],
            //   ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Slider(
          min: 0,
          max: 25,
          label: 'kk',
          activeColor: Colors.red.shade900,
          inactiveColor: Colors.red.shade100,
          value: km.toDouble(),
          onChanged: (value) {
            final distance = value.toInt();
            km = distance.toInt();
            setState(() {});
          },
          thumbColor: Colors.white,
        ),
        Text(
          "Distance range is $km km",
          style: TextStyle(fontSize: 17),
        ),
        SizedBox(
          height: 55,
        ),
        TextButton(
            onPressed: () {},
            style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                ),
                backgroundColor: WidgetStatePropertyAll(Colors.red.shade900)),
            child: Text(
              "choose doner",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ))
      ]),
    );
  }
}
