

import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'transfer.g.dart';

@JsonSerializable()
class SignupRequest{
  String username;
  String password;

  SignupRequest({required this.username, required this.password});

  factory SignupRequest.fromJson(Map<String, dynamic> json) => _$SignupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);

}

@JsonSerializable()
class SigninRequest extends SignupRequest{
  SigninRequest({required super.username, required super.password});

  factory SigninRequest.fromJson(Map<String, dynamic> json) => _$SigninRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SigninRequestToJson(this);

}

@JsonSerializable()
class SigninResponse {
  String username = "";

  SigninResponse();

  factory SigninResponse.fromJson(Map<String, dynamic> json) => _$SigninResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SigninResponseToJson(this);
}

@JsonSerializable()
class ProgressEvent{
  int value;
  DateTime timestamp;

  ProgressEvent({required this.value, required this.timestamp});

  factory ProgressEvent.fromJson(Map<String, dynamic> json) => _$ProgressEventFromJson(json);

  Map<String, dynamic> toJson() => _$ProgressEventToJson(this);
}

@JsonSerializable()
class HomeItemResponse{
   int id = 0;
   String name = "";
   int percentageDone =0 ;
   double percentageTimeSpent =0;
   DateTime deadline = DateTime(0);

   HomeItemResponse();

   factory HomeItemResponse.fromJson(Map<String, dynamic> json) => _$HomeItemResponseFromJson(json);

   Map<String, dynamic> toJson() => _$HomeItemResponseToJson(this);
}

@JsonSerializable()
class HomeItemPhotoResponse{
  int id = 0;
  String name = "";
  int percentageDone =0 ;
  double percentageTimeSpent =0;
  DateTime deadline = DateTime(0);
  int photoId= 0;

  HomeItemPhotoResponse();

  factory HomeItemPhotoResponse.fromJson(Map<String, dynamic> json) => _$HomeItemPhotoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeItemPhotoResponseToJson(this);
}

@JsonSerializable()
class AddTaskRequest{

  String name;
  DateTime deadline;

  AddTaskRequest({required this.name, required this.deadline});

  factory AddTaskRequest.fromJson(Map<String, dynamic> json) => _$AddTaskRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddTaskRequestToJson(this);
}

@JsonSerializable()
class TaskDetailResponse{
  int id = 0;
  String name = "";
  int percentageDone =0 ;
  double percentageTimeSpent =0;
  DateTime deadline = DateTime(0);

  // List<ProgressEvent> events;

  TaskDetailResponse();

  factory TaskDetailResponse.fromJson(Map<String, dynamic> json) => _$TaskDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDetailResponseToJson(this);
}

@JsonSerializable()
class TaskDetailPhotoResponse{
  int id = 0;
  String name = "";
  int percentageDone =0 ;
  double percentageTimeSpent =0;
  DateTime deadline = DateTime(0);
  int photoId =0;
  // List<ProgressEvent> events;

  TaskDetailPhotoResponse();

  factory TaskDetailPhotoResponse.fromJson(Map<String, dynamic> json) => _$TaskDetailPhotoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDetailPhotoResponseToJson(this);
}