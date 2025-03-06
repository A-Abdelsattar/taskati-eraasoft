import 'package:taskati_app/core/helpers/api_constants.dart';
import 'package:taskati_app/core/helpers/dio_helper.dart';
import 'package:taskati_app/features/home/data/models/task_model.dart';

class HomeRepo{

 static Future<TaskResponse?> getAllTasks()async{
    final response=await DioHelper.dio?.get(ApiConstants.allTasks,);
    if(response?.statusCode==200){
      return TaskResponse.fromJson(response?.data);
    }else{
      return null;
    }
  }

}