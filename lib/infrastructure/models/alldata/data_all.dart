import 'package:json_annotation/json_annotation.dart';


import '../datamodel/data_model.dart';

part 'data_all.g.dart';

@JsonSerializable()
class AllDataModel {
  @JsonKey(name: 'results')
  List<MovieDataModel> results;

  AllDataModel({this.results = const []});

  factory AllDataModel.fromJson(Map<String, dynamic> json) {
    return _$AllDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AllDataModelToJson(this);
}