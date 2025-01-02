// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'doner_bloc.dart';

// @immutable
sealed class DonerEvent {}

class DonerGetAll extends DonerEvent{

}
class DonerAdd extends DonerEvent {
  Donerdetails doner;
  DonerAdd({
  required this.doner,
  });  
}


class DonerEdit extends DonerEvent{
  Donerdetails doner;
 int docIndex;
   DonerEdit({
     required this.doner,
   required this.docIndex,
  });
  
}
class DonerDelete extends DonerEvent{
  String docIndex;
 DonerDelete({required this.docIndex});
}



class DonerSearch extends DonerEvent{
  String? donerBloodGroup;
  DonerSearch({required this.donerBloodGroup});

}

