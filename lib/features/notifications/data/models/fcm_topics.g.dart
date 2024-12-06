// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_topics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FcmTopics _$FcmTopicsFromJson(Map<String, dynamic> json) => FcmTopics(
      topics:
          (json['topics'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FcmTopicsToJson(FcmTopics instance) => <String, dynamic>{
      'topics': instance.topics,
    };
