// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'doner_bloc.dart';

// @immutable
sealed class DonerEvent extends Equatable{
 @override
  List<Object?> get props => [];
}

class DonerGetAll extends DonerEvent{

}
class DonerAdd extends DonerEvent {
  Donerdetails doner;
  DonerAdd({
  required this.doner,
  });  
  List<Object?> get props=>[doner];
  
  
}


class DonerEdit extends DonerEvent{
  Donerdetails doner;
 int docIndex;
   DonerEdit({
     required this.doner,
   required this.docIndex,
  });
  @override
    List<Object?> get props => [doner];
}
class DonerDelete extends DonerEvent{
 final  String docIndex;
 DonerDelete({required this.docIndex});
 @override
   List<Object?> get props => [docIndex];
}



class DonerSearch extends DonerEvent{
  final String? donerBloodGroup;
  DonerSearch({required this.donerBloodGroup});
  @override
    List<Object?> get props => [donerBloodGroup];

}

