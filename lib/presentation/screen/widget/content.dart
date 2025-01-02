import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/presentation/bloc/doner/doner_bloc.dart';
import 'package:project1/presentation/screen/doner/addNewdoner_screen.dart';

import '../../../domain/doner/doner_model/donerDetails.dart';
import '../../../model/save_edit_buttonmodel.dart';

class Content extends StatelessWidget {
  const Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<DonerBloc, DonerState>(
                    builder: (context, state) {
                       if (state is DonerLoading) {
                          return Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                (Text(
                                  "Please wait...",
                                  style: TextStyle(fontSize: 23),
                                )),
                                SizedBox(
                                  width: 4,
                                ),
                                SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator())
                              ],
                            ),
                          );
                        }
                      
                      if (state is DonerLoaded && state.isLoading == true) {
                        return SizedBox(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator());
                      }
                      // if(state is DonerLoaded && )
                      


                      if (state is DonerLoaded) {
                        return ListView.builder(
                            padding:
                                EdgeInsets.only(left: 10, right: 10, top: 10),
                            itemBuilder: (context, index) {
                              final document = state.DonersList[index];
                              // final document = datas[index];

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
                                                document.name,
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              Text(document.mobNo,
                                                  style:
                                                      TextStyle(fontSize: 15)),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 40,
                                          ),
                                          Text(
                                            document.bloodGroup,
                                            style: TextStyle(fontSize: 30),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Spacer(),
                                          IconButton(
                                            onPressed: () {
                                            
                                              final donerdetailsToUpdate = Donerdetails(
                                                  name: document.name,
                                                  age: document.age,
                                                  bloodGroup: document.bloodGroup,
                                                  mobNo: document.mobNo,
                                                 id:  document.id);
                                              SaveButtonMode mode = SaveButtonMode.edit;
                                              Navigator.push(context,
                                                  MaterialPageRoute(builder: (context) {
                                                return AddnewdonerScreen(indexToUpdate:index,
                                                    donerdetailsToUpdated:
                                                        donerdetailsToUpdate,
                                                    buttonMode: mode,
                                                )
;                                              }));
                                            },
                                            icon: Icon(Icons.edit),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              context.read<DonerBloc>().add(DonerDelete(docIndex: document.id));
                                              
                                            },
                                            icon: Icon(Icons.delete),
                                          )
                                        ],
                                      )));
                            },
                            itemCount: state.DonersList.length);
                      }

                      // if (state is DonerLoaded && state.selectedGroup != null) {}
                       
                      return Text("initializing..");
                    },
                  );
  }
}
