import 'dart:convert';

import 'package:project1/domain/doner/doner_model/donerDetails.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DonerDto {
 String name;
  String age;
 String bloodGroup;
 String mobNo;
 String id;
  DonerDto({
    required this.name,
    required this.age,
    required this.bloodGroup,
    required this.mobNo,
    this.id="",
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'bloodGroup': bloodGroup,
      'mobNo': mobNo,
      'id': id,
    };
  }

  factory DonerDto.fromMap(Map<String, dynamic> map) {
    return DonerDto(
      name: map['name'] as String,
      age: map['age'] as String,
      bloodGroup: map['bloodGroup'] as String,
      mobNo: map['mobNo'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DonerDto.fromJson(String source) => DonerDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return "name: $name, age: $age, bloodGroup: $bloodGroup, mobNo: $mobNo, id: $id";
    
  }
  Donerdetails toModel()=>Donerdetails(id: id,name: name, age: age, bloodGroup: bloodGroup, mobNo: mobNo);

  factory DonerDto.fromModel(Donerdetails details){
    return DonerDto(id: details.id,name: details.name, age: details.age, bloodGroup: details.bloodGroup, mobNo: details.mobNo);
  }
}
