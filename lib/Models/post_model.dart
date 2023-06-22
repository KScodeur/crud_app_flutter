import 'package:json_annotation/json_annotation.dart';
part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  int userid;
  String id;
  String title;
  String body;

  PostModel(
      {required this.userid,
      required this.id,
      required this.title,
      required this.body});
  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
