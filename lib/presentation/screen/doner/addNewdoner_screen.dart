import 'package:flutter/material.dart';
import 'package:project1/domain/model/donerDetails.dart';
import 'package:project1/model/save_edit_buttonmodel.dart';

import 'package:project1/package/firebase/firebase_service.dart';
import 'package:project1/presentation/screen/home/Homescreen.dart';

class AddnewdonerScreen extends StatefulWidget {
  Donerdetails? donerdetailsToUpdated;
  SaveButtonMode? buttonMode;

  String? docIdToUpdate;

  AddnewdonerScreen(
      {this.donerdetailsToUpdated,
      this.buttonMode,
      super.key,
      this.docIdToUpdate});

  @override
  State<AddnewdonerScreen> createState() => _AddnewdonerScreenState();
}

class _AddnewdonerScreenState extends State<AddnewdonerScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? namecontroller;
  TextEditingController? agecontroller;
  TextEditingController? groupController;
  TextEditingController? phoneNoController;

  @override
  void initState() {
    namecontroller = TextEditingController();

    agecontroller = TextEditingController();

    groupController = TextEditingController();

    phoneNoController = TextEditingController();
    if (widget.buttonMode == SaveButtonMode.edit) {
      namecontroller?.text = widget.donerdetailsToUpdated!.name;

      agecontroller?.text = widget.donerdetailsToUpdated!.age;

      groupController?.text = widget.donerdetailsToUpdated!.bloodGroup;

      phoneNoController?.text = widget.donerdetailsToUpdated!.mobNo;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.red,
                      size: 27,
                    )),
              ],
            ),
            SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Can\'t be empty';
                }
              },
              controller: namecontroller,
              decoration: InputDecoration(
                  hintText: "name",
                  hintStyle: TextStyle(color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: agecontroller,
              decoration: InputDecoration(
                  hintText: "age",
                  hintStyle: TextStyle(color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Can\'t be empty';
                }
              },
              controller: groupController,
              decoration: InputDecoration(
                  hintText: "Bloodgroup",
                  hintStyle: TextStyle(color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Can\'t be empty';

                }
                if(value.length>10 || value.length<10){
                  return 'inavlid contact number';
                }
              },
              controller: phoneNoController,
              decoration: InputDecoration(
                  hintText: "phoneNo",
                  hintStyle: TextStyle(color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.red.shade700)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (widget.buttonMode == SaveButtonMode.edit) {
                      Map<String, dynamic> data = Donerdetails(
                              name: namecontroller!.text.trim(),
                              age: agecontroller!.text.trim(),
                              bloodGroup: groupController!.text.trim(),
                              mobNo: phoneNoController!.text.trim())
                          .toMap();
                      FirebaseService()
                          .editDonerDetails(widget.docIdToUpdate!, data);
                    } else {
                      Map<String, dynamic> data = Donerdetails(
                              name: namecontroller!.text.trim(),
                              age: agecontroller!.text.trim(),
                              bloodGroup: groupController!.text.trim(),
                              mobNo: phoneNoController!.text.trim())
                          .toMap();
                      FirebaseService().addetails(data);
                    }
                    widget.buttonMode = SaveButtonMode.save;

                    Navigator.pop(context,Homescreen(selectedGroup: null));
                  }
                },
                child: Center(
                    child: Text(
                  widget.buttonMode == SaveButtonMode.edit ? "Edit" : "Save",
                  style: TextStyle(color: Colors.white),
                )))
          ],
        ),
      ),
    ));
  }
}
