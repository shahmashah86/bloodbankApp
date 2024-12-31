import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Donerdetails {
 String name;
  String age;
 String bloodGroup;
 String mobNo;

  Donerdetails({
    required this.name,
    required this.age,
    required this.bloodGroup,
    required this.mobNo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'bloodGroup': bloodGroup,
      'mobNo': mobNo,
    };
  }

  factory Donerdetails.fromMap(Map<String, dynamic> map) {
    return Donerdetails(
      name: map['name'] as String,
      age: map['age'] as String,
      bloodGroup: map['bloodGroup'] as String,
      mobNo: map['mobNo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Donerdetails.fromJson(String source) => Donerdetails.fromMap(json.decode(source) as Map<String, dynamic>);
}
