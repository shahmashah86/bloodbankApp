
part of 'doner_bloc.dart';

sealed class DonerState {}

final class DonerInitial extends DonerState {}
class DonerLoading extends DonerState{}
class DonerLoaded extends DonerState {
  final List<Donerdetails> DonersList;
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
  });
DonerLoaded copyWith({List<Donerdetails>? DonersList,
bool? isError,
bool? isLoading,
String? message,
String? selectedGroup

}){
  return DonerLoaded(DonersList: DonersList??this.DonersList,
  isError: isError??this.isError,
  isLoading: isLoading??this.isLoading,
  message: message??this.message,
  );
}
}
final class DonerError extends DonerState {}
