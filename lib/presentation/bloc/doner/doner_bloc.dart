import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/domain/doner/doner_model/donerDetails.dart';
import 'package:project1/domain/doner/doner_repository/doner_repository.dart';
part 'doner_event.dart';
part 'doner_state.dart';

class DonerBloc extends Bloc<DonerEvent, DonerState> {
  final DonerRepository donerRepository; //////////////////////////////
  DonerBloc(this.donerRepository) : super(DonerInitial()) {
    on<DonerGetAll>(_donergetAll);
    on<DonerAdd>(_donerAdd);
    on<DonerEdit>(_donerEdit);
    on<DonerDelete>(_donerDelete);
    // on<DonerSearch>(_donerSearch);
  }
  void _donergetAll(DonerGetAll event, Emitter<DonerState> emit) async {
    emit(DonerLoading());
    try {
      List<Donerdetails> donersList = await donerRepository.getAllDoner();
      emit(DonerLoaded(DonersList: donersList));
    } catch (e) {
      emit(DonerError());
    }
  }

  void _donerAdd(DonerAdd event, Emitter<DonerState> emit) {
    final currentstate = state;
    if (currentstate is DonerLoaded) {
      emit(currentstate.copyWith(isLoading: true));
      try {
        donerRepository.addDonerDetail(event.doner);
        emit(currentstate.copyWith(
            DonersList: List.from(currentstate.DonersList)..add(event.doner),
            isLoading: false));
      } catch (e) {
        emit(currentstate.copyWith(
            DonersList: List.from(currentstate.DonersList),
            isLoading: false,
            isError: true,
            message: e.toString()));
      }
    }
  }

  void _donerEdit(DonerEdit event, Emitter<DonerState> emit) {
    final currentState = state;

    if (currentState is DonerLoaded) {
      emit(currentState.copyWith(isLoading: true));
      try {
        donerRepository.editDonerDetails(event.doner);
        emit(currentState.copyWith(
            DonersList: List.from(currentState.DonersList)
              ..removeWhere((element) {
                print('Removing Doner with ID: ${element.id}');
                return element.id == event.doner.id;
              })
              ..insert(event.docIndex, event.doner),
            isLoading: false));
        print('After: ${currentState.DonersList}');
      } catch (e) {
        emit(currentState.copyWith(
            DonersList: currentState.DonersList,
            isError: true,
            isLoading: false,
            message: e.toString()));
      }
    }
  }

  void _donerDelete(DonerDelete event, Emitter<DonerState> emit) {
    final currentstate = state;
    if (currentstate is DonerLoaded) {
      emit(currentstate.copyWith(isLoading: true));
      try {
        donerRepository.deleteDonerDetails(event.docIndex);
        emit(currentstate.copyWith(
            DonersList: List.from(currentstate.DonersList)
              ..removeWhere((element) => element.id == event.docIndex),
            isLoading: false));
      } catch (e) {
        emit(currentstate.copyWith(
            DonersList: currentstate.DonersList,
            isError: true,
            isLoading: false,
            message: e.toString()));
      }
    }
  }

  void _donerSearch(DonerSearch event, Emitter<DonerState> emit) {
    final currentstate = state;
    if (currentstate is DonerLoaded) {
      emit(currentstate.copyWith(isLoading: true));
      try {
        emit(currentstate.copyWith(
            DonersList: currentstate.DonersList,
            selectedGroup: event.donerBloodGroup));
      } catch (e) {
        emit(currentstate.copyWith(
            DonersList: List.from(currentstate.DonersList),
            isLoading: false,
            isError: true,
            message: e.toString()));
      }
    }
  }
}
