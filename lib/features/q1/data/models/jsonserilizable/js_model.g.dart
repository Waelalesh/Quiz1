// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'js_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsModel _$JsModelFromJson(Map<String, dynamic> json) => JsModel(
      json['company'] == null
          ? null
          : JsCompany.fromJson(json['company'] as Map<String, dynamic>),
    );

abstract final class _$JsModelJsonKeys {
  final String jsCompany = 'company';
}

Map<String, dynamic> _$JsModelToJson(JsModel instance) => <String, dynamic>{
      'company': instance.jsCompany,
    };

JsCompany _$JsCompanyFromJson(Map<String, dynamic> json) => JsCompany(
      isActive: (json['is_active']) ?? 1,
      name: json['name'] as String,
      address: json['address'] == null
          ? null
          : JsAddress.fromJson(json['address'] as Map<String, dynamic>),
      established: DateTime.parse(
          MyDateTime.convertDateToFormattedString(json['established'])),
      departments: (json['departments'] as List<dynamic>)
          .map((e) => JsDepartment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

abstract final class _$JsCompanyJsonKeys {
  final String isActive = 'is_active';
  final String name = 'name';
  final String address = 'address';
  final String established = 'established';
  final String departments = 'departments';
}

Map<String, dynamic> _$JsCompanyToJson(JsCompany instance) {
  return <String, dynamic>{
    'is_active': instance.isActive,
    'name': instance.name,
    'address': instance.address!.toJson(),
    'established': instance.established.toIso8601String(),
    'departments': instance.departments.map((e) => e.toJson()),
  };
}

JsAddress _$JsAddressFromJson(Map<String, dynamic> json) => JsAddress(
      street: json['street'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      postalCode: json['postalCode'] as String,
    );

Map<String, dynamic> _$JsAddressToJson(JsAddress instance) => <String, dynamic>{
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'postalCode': instance.postalCode,
    };

JsDepartment _$JsDepartmentFromJson(Map<String, dynamic> json) => JsDepartment(
      deptId: json['deptId'] as String,
      name: json['name'] as String,
      manager: json['manager'] as String,
      budget: (json['budget'] as num).toDouble(),
      year: (json['year'] as num?)?.toInt(),
      availability: json['availability'] == null
          ? null
          : JsAvailability.fromJson(
              json['availability'] as Map<String, dynamic>),
      meetingTime: json['meeting_time'] as String,
    );

Map<String, dynamic> _$JsDepartmentToJson(JsDepartment instance) =>
    <String, dynamic>{
      'deptId': instance.deptId,
      'name': instance.name,
      'manager': instance.manager,
      'budget': instance.budget,
      'year': instance.year,
      'availability': instance.availability?.toJson(),
      'meeting_time': instance.meetingTime,
    };

JsAvailability _$JsAvailabilityFromJson(Map<String, dynamic> json) =>
    JsAvailability(
      json['inStore'] as bool?,
      json['online'] as bool?,
    );

Map<String, dynamic> _$JsAvailabilityToJson(JsAvailability instance) =>
    <String, dynamic>{
      'online': instance.online,
      'inStore': instance.instore,
    };
