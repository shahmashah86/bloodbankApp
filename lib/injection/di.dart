import 'package:get_it/get_it.dart';
import 'package:project1/data/auth/auth_repositor_impl/auth_repository_implementation.dart';

import 'package:project1/data/doner/doner_repository_implementation/doner_repository_implementation.dart';
import 'package:project1/domain/auth/auth_repository/auth_repository.dart';
import 'package:project1/domain/doner/doner_repository/doner_repository.dart';
import 'package:project1/presentation/bloc/auth/auth_bloc.dart';
import 'package:project1/presentation/bloc/doner/doner_bloc.dart';

final getIt=GetIt.instance;
void setup(){
  getIt.registerSingleton<DonerRepository>(DonerRepositoryImplementation());
    getIt.registerSingleton<AuthRepository>(AuthRepositoryImplementation());
  // getIt.registerSingleton()

  getIt.registerSingleton<DonerBloc>(DonerBloc(getIt<DonerRepository>()));
  getIt.registerSingleton<AuthBloc>(AuthBloc(getIt<AuthRepository>()));
}