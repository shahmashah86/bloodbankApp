
part of 'doner_bloc.dart';

sealed class DonerState extends Equatable{
    @override
  List<Object?> get props => [];
}

final class DonerInitial extends DonerState {}
class DonerLoading extends DonerState{}
class DonerLoaded extends DonerState {
  final List<Donerdetails> DonersList;
  final List<Donerdetails>? selectedDonerList;
  final String message;
  final bool isError;
  final bool isLoading;
  final String? selectedGroup;
  DonerLoaded({
    required this.DonersList,
    this.message='',
    this.isError=false,
    this.isLoading=false,
    this.selectedGroup,
    this.selectedDonerList
  });

@override
  List<Object?> get props=>[DonersList,message,isError,isError,selectedGroup,selectedDonerList];

DonerLoaded copyWith({List<Donerdetails>? DonersList,
bool? isError,
bool? isLoading,
String? message,
String? selectedGroup,
List<Donerdetails>? selectedDonerList


}){
  return DonerLoaded(DonersList: DonersList??this.DonersList,
  isError: isError??this.isError,
  isLoading: isLoading??this.isLoading,
  message: message??this.message,
  selectedGroup: selectedGroup??this.selectedGroup,
  selectedDonerList:selectedDonerList??this.selectedDonerList
  );
}
}
final class DonerError extends DonerState {}
