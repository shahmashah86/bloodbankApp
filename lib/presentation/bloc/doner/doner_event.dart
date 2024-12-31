// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'doner_bloc.dart';

@immutable
sealed class DonerEvent {}
class DonerAdd extends DonerEvent {
  Donerdetails? doner;
  DonerAdd({
    this.doner,
  });
  
}


class DonerEdit extends DonerEvent{
  
  
}
class DonerDelete extends DonerEvent{}
class DonerSearch extends DonerEvent{}

