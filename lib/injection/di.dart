import 'package:get_it/get_it.dart';
import 'package:project1/data/doner/doner_repository_impl/doner_repository_implementation.dart';
import 'package:project1/domain/doner/doner_repository/doner_repository.dart';
import 'package:project1/presentation/bloc/doner/doner_bloc.dart';

final getIt=GetIt.instance;
void setup(){
  getIt.registerSingleton<DonerRepository>(DonerRepositoryImplementation());
  // getIt.registerSingleton()

  getIt.registerSingleton<DonerBloc>(DonerBloc(getIt<DonerRepository>()));
}