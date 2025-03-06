import 'package:taskati_app/core/helpers/api_constants.dart';
import 'package:taskati_app/core/helpers/dio_helper.dart';
import 'package:taskati_app/features/login/data/models/login_response_model.dart';

class LoginRepo{



  Future<LoginResponseModel?> login({required String email,required String password})async{
    final response=await DioHelper.dio?.post(ApiConstants.login,
    data: {
      "email":email,
      "password":password
    }
    );
    if(response?.statusCode==200){
      return LoginResponseModel.fromJson(response?.data);
    }else{
      return null;
    }
  }
}