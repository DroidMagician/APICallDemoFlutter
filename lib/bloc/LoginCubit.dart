
import 'package:apicalldemo/bloc/login_bloc.dart';
import 'package:apicalldemo/network/UserDetails.dart';
import 'package:bloc/bloc.dart';

import '../network/DioClient.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit() : super(LoginInitial());
  final DioClient client = DioClient();


  doLogin(UserDetails userDetails) async
  {
    print(userDetails.toJson());
    if(userDetails.url == null)
    {
      emit(state.copyWith(errorMessage: "Please Enter URL"));
    }
    else if(userDetails.username == null)
    {
      emit(state.copyWith(errorMessage: "Please Enter UserName"));
    }
    else if(userDetails.password == null)
    {
      emit(state.copyWith(errorMessage: "Please Enter Password"));
    }
    else{
      emit(state.copyWith(showProgress: true,errorMessage: "",items: null));
      var response = await client.createUser(
          userInfo: userDetails);
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
  }
}