part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class URLChanged extends LoginEvent{
  final String url;
  const URLChanged(this.url);
  @override
  List<Object?> get props => [url];
}

class UserNameChanged extends LoginEvent{
  final String userName;
  const UserNameChanged(this.userName);
  @override
  List<Object?> get props => [userName];
}

class PasswordChanged extends LoginEvent{
  final String password;
  const PasswordChanged(this.password);
  @override
  List<Object?> get props => [password];
}

class DoLoginEvent extends LoginEvent{
  final UserDetails userDetails;
  const DoLoginEvent(this.userDetails);
  @override
  List<Object?> get props => [userDetails];

}