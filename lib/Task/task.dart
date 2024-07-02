import 'package:json_annotation/json_annotation.dart';

part './task.g.dart';


@JsonSerializable()
class Task{
  String name;
  DateTime creationDate;
  DateTime deadline;
  int progress;
  int photoId;

  Task({required this.name, required this.creationDate, required this.deadline, required this.progress, required this.photoId});

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);

}