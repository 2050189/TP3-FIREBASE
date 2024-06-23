// import 'dart:js';

import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:tp1_flutter/connexion.dart';
import 'package:tp1_flutter/inscription.dart';

import 'DTOs/transfer.dart';
import 'generated/l10n.dart';
import 'main.dart';

class SingletonDIO{


  static var cookiemanager = CookieManager(CookieJar());



  static Dio getDio() {
    Dio dio = Dio();
    dio.interceptors.add(cookiemanager);
    return dio;
  }

  static String pseudoSingleton = "";


}

String baseUrl = "http://10.0.2.2:8080/";

// void printToast(String servMsg, StatefulWidget page) async{
//
//   BuildContext context = page as BuildContext;
//
//   switch(servMsg){
//     case "UsernameAlreadyTaken":
//       Fluttertoast.showToast(msg: S.of(context).usernameTaken, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
//       break;
//     case "UsernameNotFoundException" :
//       Fluttertoast.showToast(msg: S.of(context).usernameNotFound, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
//       break;
//   }
//
// }



Future<Object?> Register(SignupRequest signupReq) async {
  try{
    var response = await SingletonDIO.getDio().post(baseUrl+"api/id/signup", data: signupReq.toJson());

    print(response);
    SingletonDIO.pseudoSingleton = signupReq.username;
    return SigninResponse.fromJson(response.data);
  }
  catch(e){
    if(e is DioException){
      print(e.response);
      if(e.response?.data != null && e.response!.data == "UsernameAlreadyTaken"){
        return e.response?.data;
      }

        return "connection problem";


    }
    print(e);
    rethrow;
  }

}

Future<Object?> Login(SigninRequest signinReq) async {
  try{
    var response = await SingletonDIO.getDio().post(baseUrl+"api/id/signin", data: signinReq.toJson());
    print(response);
    SingletonDIO.pseudoSingleton = signinReq.username;
    return SigninResponse.fromJson(response.data);
  }
  catch(e){
    if(e is DioException){
      print(e.response);
      if(e.response?.data != null){
        return e.response?.data;
      }

      return "connection problem";


    }
    print(e);
    rethrow;
  }

}

Future<String> Logout() async{
  try{
    var response = await SingletonDIO.getDio().post(baseUrl+"api/id/signout");
    print(response);
    SingletonDIO.pseudoSingleton = "";
    return response.toString();
  }
  catch(e){
    print(e);
    throw(e);
  }
}

Future GetAllTasks() async {
  try{
    var response = await SingletonDIO.getDio().get(baseUrl+"api/home");
    print(response);
    var listeJSON = response.data as List;
    var listeTasks = listeJSON.map((elementJSON) {
      return HomeItemResponse.fromJson(elementJSON);
    }).toList();
    return listeTasks;
  }
  catch(e){
    if(e is DioException){
      print(e.response);
      if(e.response?.data != null){
        return e.response?.data;
      }

      return "connection problem";


    }
    print(e);
    rethrow;
  }
}

Future GetAllTasksPhotos() async {
  try{
    var response = await SingletonDIO.getDio().get(baseUrl+"api/home/photo");
    print(response);
    var listeJSON = response.data as List;
    var listeTasks = listeJSON.map((elementJSON) {
      return HomeItemPhotoResponse.fromJson(elementJSON);
    }).toList();
    return listeTasks;
  }
  catch(e){
    if(e is DioException){
      print(e.response);
      if(e.response?.data != null){
        return e.response?.data;
      }

      return "connection problem";


    }
    print(e);
    rethrow;
  }
}

CreateTask(AddTaskRequest addtaskReq) async {
  try{
    var response = await SingletonDIO.getDio().post(baseUrl+"api/add", data: addtaskReq.toJson());
    print(response);
  }
  catch(e){
    if(e is DioException){
      print(e.response);
      if(e.response?.data != null){
        return e.response?.data;
      }

      return "connection problem";


    }
    print(e);
    rethrow;
  }

}

sendImg(String imagePath, int taskId) async {
  try{
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(imagePath, filename: taskId.toString()),
      "taskID" : await taskId
    });
    var response = await SingletonDIO.getDio().post(baseUrl+"file", data: formData);
    print(response);
    return response.data;
  }
  catch(e){
    if(e is DioException){
      print(e.response);
      if(e.response?.data != null){
        return e.response?.data;
      }

      return "connection problem";


    }
    print(e);
    rethrow;
  }
}

// getImg(int photoID) async {
//   try{
//     var response = await SingletonDIO.getDio().get(baseUrl+"file/$photoID");
//     print(response);
//     return response.data;
//   }
//   catch(e){
//     if(e is DioException){
//       print(e.response);
//       if(e.response?.data != null){
//         return e.response?.data;
//       }
//
//       return "connection problem";
//
//
//     }
//     print(e);
//     rethrow;
//   }
// }

Future<TaskDetailResponse> SeeTask(int taskID) async {
  try{
    var response = await SingletonDIO.getDio().get(baseUrl+"api/detail/$taskID");
    print(response);
    return TaskDetailResponse.fromJson(response.data);
  }
  catch(e){
    print(e);
    throw(e);
  }
}

ChangeProgress(int taskID, int value) async {
  try{
    var response = await SingletonDIO.getDio().get(baseUrl+"api/progress/$taskID/$value");
    print(response);
  }
  catch(e){
    print(e);
    throw(e);
  }
}

Future<TaskDetailPhotoResponse> SeeTaskPhoto(int taskID) async {
  try{
    var response = await SingletonDIO.getDio().get(baseUrl+"api/detail/photo/$taskID");
    print(response);
    return TaskDetailPhotoResponse.fromJson(response.data);
  }
  catch(e){
    print(e);
    throw(e);
  }
}