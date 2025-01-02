import 'package:project1/domain/doner/doner_model/donerDetails.dart';

abstract class DonerRepository {
  Future<List<Donerdetails>> getAllDoner();
  void addDonerDetail(Donerdetails doner);
  void editDonerDetails(Donerdetails dataToupdate);
  void deleteDonerDetails(String docId);
}