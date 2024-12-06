// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'fcm_topics.g.dart';

@JsonSerializable()
class FcmTopics extends Equatable {
  final List<String> topics;
  const FcmTopics({required this.topics});

  @override
  List<Object?> get props => [topics];

  Map<String, dynamic> toMap() {
    if (topics.length == 1) {
      return {
        'topic': topics[0],
      };
    } else {
      return {
        'condition': _getTopicsCondition,
      };
    }
  }

  get _getTopicsCondition {
    return topics.map((e) => " '$e' in topics").join(" || ");
  }

  String toJson() => json.encode(toMap());

  factory FcmTopics.fromJson(Map<String, dynamic> json) =>
      _$FcmTopicsFromJson(json);
}
