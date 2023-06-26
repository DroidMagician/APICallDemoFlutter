import 'dart:async';

import 'package:apicalldemo/network/UserDetails.dart';
import 'package:apicalldemo/network/UserResponseModel.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../network/DioClient.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final DioClient client = DioClient();
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {

    });

    on<DoLoginEvent>((event, emit) async{
      print(event.userDetails.toJson());
      if(event.userDetails.url == null)
        {
          emit(state.copyWith(errorMessage: "Please Enter URL"));
        }
      else if(event.userDetails.username == null)
      {
        emit(state.copyWith(errorMessage: "Please Enter UserName"));
      }
      else if(event.userDetails.password == null)
      {
        emit(state.copyWith(errorMessage: "Please Enter Password"));
      }
      else{
        emit(state.copyWith(showProgress: true,errorMessage: "",items: null));
        var response = await client.createUser(
            userInfo: event.userDetails);
        print("Inside Bloc ${response?.toJson()}");
        emit(state.copyWith(showProgress: false,errorMessage: "",items: null));
        if(response != null)
          {
            emit(state.copyWith(items: response,errorMessage: ""));
          }
        else{
          emit(state.copyWith(errorMessage: "Something went wrong",items: null));
        }
      }

    });
  }
}
