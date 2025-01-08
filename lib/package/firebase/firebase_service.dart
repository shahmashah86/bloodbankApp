import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project1/data/doner/doner_dto/doner_dto.dart';
import 'package:project1/domain/doner/doner_model/donerDetails.dart';

import 'package:uuid/uuid.dart';

class FirebaseService {
  String collectionName = "PersonData";
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  void addDonerdetails(Donerdetails data) async {
    String uniqueId = Uuid().v4();
    final docRef = firestore.collection(collectionName).doc(uniqueId);

    await docRef.set(DonerDto.fromModel(data..id = uniqueId).toMap());
    // firestore.collection(collectionName).add(data.toMap());
  }

  void deleteDonerDetails(String docindexTodelete) {
    firestore.collection(collectionName).doc(docindexTodelete).delete().onError((e, stack) {
      log(e.toString(), name: "Error in Delete");
    });
  }

  void editDonerDetails(Donerdetails dataToupdate) async{
    
    final DocumentReference<Map<String, dynamic>> documentRef= firestore
        .collection(collectionName)
        .doc(dataToupdate.id);
      await  documentRef.update(DonerDto.fromModel(dataToupdate).toMap())
        .onError(
          (e, stackTrace) =>  log(e.toString(), name: "Error in Edit")
        );
  }

  Future<List<Donerdetails>> GetAllDoner() async {
    final querySnapshot = await firestore.collection(collectionName).get();
    return querySnapshot.docs
        .map((e) => DonerDto.fromMap(e.data()).toModel())
        .toList();
  }

}
