import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project1/domain/model/donerDetails.dart';


part 'doner_event.dart';
part 'doner_state.dart';

class DonerBloc extends Bloc<DonerEvent, DonerState> {
  DonerBloc() : super(DonerInitial()) {
    on<DonerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
