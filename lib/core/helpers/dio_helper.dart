import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:taskati_app/core/helpers/api_constants.dart';
import 'package:taskati_app/core/helpers/shared_prefs_helper.dart';

class DioHelper{
  static Dio? dio;
  static init(){
    dio=Dio(
        BaseOptions(baseUrl: ApiConstants.baseUrl,
            headers: {
              "Accept":"application/json",
              "Authorization":"Bearer ${SharedPrefsHelper.getString("token")}"
            }
        )
    );

    dio?.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args){
          // don't print requests with uris containing '/posts'
          if(options.path.contains('/posts')){
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        }
    )
    );
  }



}