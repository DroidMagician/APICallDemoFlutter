part of 'login_bloc.dart';

 class LoginState{

  final UserResponseModel? userResponseModel;
  final String errorMessage;
  final bool showProgress;

  const LoginState({
    this.userResponseModel ,
    this.errorMessage = "",
    this.showProgress = false,
  });

  // @override
  // List<Object?> get props => [userResponseModel, errorMessage];

  LoginState copyWith({UserResponseModel? items, String? errorMessage,bool? showProgress}) {
    return LoginState(userResponseModel: items , errorMessage: errorMessage ?? this.errorMessage,showProgress: showProgress ?? this.showProgress);
  }

}
class LoginInitial extends LoginState {
  LoginInitial();

}



