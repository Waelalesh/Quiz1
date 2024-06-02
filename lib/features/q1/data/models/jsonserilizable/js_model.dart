
import 'package:dart_advanced_modeling/features/q1/data/models/date_time_mixin.dart';
import 'package:json_annotation/json_annotation.dart';
part 'js_model.g.dart';

@JsonSerializable(createJsonKeys: true)
class JsModel {
  @JsonKey(name: "company")
  JsCompany? jsCompany;
  JsModel(
    this.jsCompany,
  );
  factory JsModel.fromJson(Map<String, dynamic> json) =>
      _$JsModelFromJson(json);
}

@JsonSerializable(createJsonKeys: true)
class JsCompany {
  @JsonKey(name: "is_active", defaultValue: 1, nullable: true)
  int isActive;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "address")
  JsAddress? address; // Mark address as nullable to handle null values
  @JsonKey(name: "established")
  DateTime established;
  @JsonKey(name: "departments")
  List<JsDepartment> departments;

  JsCompany({
    required this.isActive,
    required this.name,
    this.address,
    required this.established,
    required this.departments,
  });

  factory JsCompany.fromJson(Map<String, dynamic> json) =>
      _$JsCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$JsCompanyToJson(this);
}

@JsonSerializable(explicitToJson: true)
class JsAddress {
  @JsonKey(name: "street")
  String street;
  @JsonKey(name: "city")
  String city;
  @JsonKey(name: "state")
  String state;
  @JsonKey(name: "postalCode")
  String postalCode;

  JsAddress({
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
  });

  factory JsAddress.fromJson(Map<String, dynamic> json) =>
      _$JsAddressFromJson(json);

  Map<String, dynamic> toJson() => _$JsAddressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class JsDepartment {
  @JsonKey(name: "deptId")
  String deptId;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "manager")
  String manager;
  @JsonKey(name: "budget")
  double budget;
  @JsonKey(name: "year")
  int? year;
  @JsonKey(name: "availability")
  JsAvailability? availability;
  @JsonKey(name: "meeting_time")
  String meetingTime;

  JsDepartment({
    required this.deptId,
    required this.name,
    required this.manager,
    required this.budget,
    this.year,
    this.availability,
    required this.meetingTime,
  });

  factory JsDepartment.fromJson(Map<String, dynamic> json) =>
      _$JsDepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$JsDepartmentToJson(this);
}

@JsonSerializable()
class JsAvailability {
  @JsonKey(name: "online")
  bool? online;
  @JsonKey(name: "inStore")
  bool? instore;
  JsAvailability(this.instore, this.online);
  factory JsAvailability.fromJson(Map<String, dynamic> json) =>
      _$JsAvailabilityFromJson(json);
  Map<String, dynamic> toJson() => _$JsAvailabilityToJson(this);
}
