import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project1/presentation/screen/home/Homescreen.dart';

class FirebaseService {


  String collectionName = "PersonData";
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  void addetails(Map<String,dynamic> data){
  firestore.collection(collectionName).add(data);
}

void deleteDetails(String docindexTodelete){
  firestore.collection(collectionName).doc(docindexTodelete).delete();}


  void editDonerDetails(String docId,Map<String,dynamic>dataToupdate){
    firestore.collection(collectionName).doc(docId).update(dataToupdate).onError((error, stackTrace) => "error",);
  }

  // void getAdoner(String bloodGroup){
  //     firestore.collection(collectionName).where('bloodGroup',isEqualTo: bloodGroup);
  //     // firestore.collection(collectionName).orderBy('name',descending: true).limit(2);
  // }
  //  Stream<QuerySnapshot> getAdoner(String bloodGroup) {
  //   return firestore
  //       .collection(collectionName)
  //       .where('bloodGroup', isEqualTo: bloodGroup)
  //       .snapshots();
  // }

}

