part of 'task.dart';




Task _$TaskFromJson(Map<String, dynamic> json) =>
    Task(
      id: json['id'] as String,
      name: json['name'] as String,
      creationDate: json['creationDate'] as Timestamp,
      deadline: json['deadline'] as Timestamp,
      progress: json['progress'] as int,
      photoId: json['photoId'] as int
    );

Map<String, dynamic> _$TaskToJson(Task instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'creationDate': instance.creationDate,
      'deadline': instance.deadline,
      'progress': instance.progress,
      'photoId': instance.photoId,

    };