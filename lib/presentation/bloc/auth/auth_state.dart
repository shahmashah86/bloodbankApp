part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}
final class AuthSuccess extends AuthState {
  final AuthModel authModel;

  const AuthSuccess({required this.authModel});

  AuthSuccess copyWith({
    AuthModel? authmodel,
  }) {
    return AuthSuccess(authModel: authmodel??this.authModel);
  }
}

final class AuthError extends AuthState {

   
   final String? errormsg;

  const AuthError({this.errormsg});
    @override
  List<Object> get props => [errormsg!];

  AuthError copyWith({
   String? errormsg
  }) {
    return AuthError(errormsg: errormsg??this.errormsg);
  }

}

final class AuthSignOutSuccess extends AuthState {}
final class AuthSignOutError extends AuthState {}
