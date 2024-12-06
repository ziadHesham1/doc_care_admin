// // ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'package:doc_care_admin/features/notifications/data/models/fcm_body_data.dart';
// import 'package:doc_care_admin/features/notifications/data/models/fcm_topics.dart';
// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'fcm_request_body.g.dart';

// // dart pub run build_runner build --delete-conflicting-outputs
// @JsonSerializable()
// class FcmRequestBody extends Equatable {
//   final FcmBodyData notification;
//   final Map<String, dynamic> data;
//   final FcmTopics topics;
//   const FcmRequestBody(
//     fcmBodyData, {
//     required this.notification,
//     required this.data,
//     required this.topics,
//   });
//   @override
//   List<Object?> get props => [notification, data, topics];

//   Map<String, dynamic> toJson() {
//     return {'message': _$FcmRequestBodyToJson(this)};
//   }

//   factory FcmRequestBody.fromJson(Map<String, dynamic> json) =>
//       _$FcmRequestBodyFromJson(json);
// }
