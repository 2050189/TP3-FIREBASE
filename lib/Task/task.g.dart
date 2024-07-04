part of 'task.dart';




TODOTask _$TODOTaskFromJson(Map<String, dynamic> json) =>
    TODOTask(
      id: json['id'] as String,
      name: json['name'] as String,
      creationDate: json['creationDate'] as Timestamp,
      deadline: json['deadline'] as Timestamp,
      progress: json['progress'] as int,
      photoURL: json['photoURL'] as String
    );

Map<String, dynamic> _$TODOTaskToJson(TODOTask instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'creationDate': instance.creationDate,
      'deadline': instance.deadline,
      'progress': instance.progress,
      'photoURL': instance.photoURL,

    };