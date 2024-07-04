import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part './task.g.dart';


@JsonSerializable()
class TODOTask{
  String id;
  String name;
  Timestamp creationDate;
  Timestamp deadline;
  int progress;
  String photoURL;

  TODOTask({required this.id,required this.name, required this.creationDate, required this.deadline, required this.progress, required this.photoURL});

  factory TODOTask.fromJson(Map<String, dynamic> json) => _$TODOTaskFromJson(json);

  Map<String, dynamic> toJson() => _$TODOTaskToJson(this);

}