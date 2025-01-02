import 'package:project1/domain/doner/doner_model/donerDetails.dart';
import 'package:project1/domain/doner/doner_repository/doner_repository.dart';
import 'package:project1/package/firebase/firebase_service.dart';

class DonerRepositoryImplementation extends DonerRepository {
  @override
  Future<List<Donerdetails>> getAllDoner() async {
    return await FirebaseService().GetAllDoner();
  }

  @override
  void addDonerDetail(Donerdetails doner) {
    FirebaseService().addDonerdetails(doner);
  }

  @override
  void deleteDonerDetails(String docId) {
    FirebaseService().deleteDonerDetails(docId);
  }

  @override
  void editDonerDetails(Donerdetails dataToupdate) {
    FirebaseService().editDonerDetails(dataToupdate);
  }
}
