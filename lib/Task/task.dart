import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part './task.g.dart';


@JsonSerializable()
class Task{
  String id;
  String name;
  Timestamp creationDate;
  Timestamp deadline;
  int progress;
  int photoId;

  Task({required this.id,required this.name, required this.creationDate, required this.deadline, required this.progress, required this.photoId});

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);

}