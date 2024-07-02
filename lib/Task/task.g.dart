part of 'task.dart';




Task _$TaskFromJson(Map<String, dynamic> json) =>
    Task(
      name: json['name'] as String,
      creationDate: json['creationDate'] as DateTime,
      deadline: json['deadline'] as DateTime,
      progress: json['progress'] as int,
      photoId: json['photoId'] as int
    );

Map<String, dynamic> _$TaskToJson(Task instance) =>
    <String, dynamic>{
      'name': instance.name,
      'creationDate': instance.creationDate,
      'deadline': instance.deadline,
      'progress': instance.progress,
      'photoId': instance.photoId,

    };