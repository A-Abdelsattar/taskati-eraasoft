import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());


  Dio? dio=Dio(
    BaseOptions(baseUrl: "https://api.gosorsolutions.com/api/",
    headers: {
      "Accept":"application/json"
    }
    )
  );

 Future login(String email,String pass)async{
    emit(LoginLoadingState());
   await dio?.post("login",data: {
      "email":email,
      "password":pass
    }).then((value){
      emit(LoginSuccessState());
    }).catchError((error){
    if(error is DioException){
      print("********");
      print("${error.response?.data?["error"]}");
      emit(LoginErrorState(error.response?.data?["error"]));
    }
    });
  }

}
