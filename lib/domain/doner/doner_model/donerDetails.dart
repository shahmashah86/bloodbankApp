import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Donerdetails {
 String name;
  String age;
 String bloodGroup;
 String mobNo;
 String id;

  Donerdetails({
    required this.name,
    required this.age,
    required this.bloodGroup,
    required this.mobNo,
     this.id='',
  });
@override
  String toString() {
    return "name: $name, age: $age, bloodGroup: $bloodGroup, mobNo: $mobNo, id: $id";
  }

 


}
