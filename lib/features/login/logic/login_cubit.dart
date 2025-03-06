import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:taskati_app/core/helpers/dio_helper.dart';
import 'package:taskati_app/core/helpers/shared_prefs_helper.dart';
import 'package:taskati_app/features/login/data/models/login_response_model.dart';

import '../data/repo/login_repo.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());




  LoginResponseModel? loginResponse;
  LoginRepo loginRepo=LoginRepo();

Future<void> login({required String email,required String password})async{
  emit(LoginLoadingState());
  loginResponse= await loginRepo.login(email: email, password: password);
  if(loginResponse!=null){
    SharedPrefsHelper.setString("token",loginResponse?.userData?.token??"");
    emit(LoginSuccessState());
  }else{
    emit(LoginErrorState("Could not login"));
  }
}

Future<void> login2({required String email,required String password})async{
  emit(LoginLoadingState());
  emit(LoginLoadingState());
  await loginRepo.login(email: email, password: password).then((value){
    loginResponse=value;
    emit(LoginSuccessState());
  }).catchError((error){
    emit(LoginErrorState(error.toString()));
  });

}


}

