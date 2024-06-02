// ignore_for_file: prefer_if_null_operators, prefer_typing_uninitialized_variables, avoid_function_literals_in_foreach_calls

import 'package:dart_advanced_modeling/features/q1/data/models/date_time_mixin.dart';

class MTest1 {
  MTest1(
    this.isActive,
    this.name,
    this.adress,
    this.established,
    this.mDepartments,
  );
  int? isActive;
  String? name;
  MAdress? adress;
  String? established;
  List<MDepartments>? mDepartments;
  factory MTest1.fromJson(Map<String, dynamic> json) {
    MAdress? m;
    if (json['address'] != null) {
      MAdress.fromJson(json['address']);
    }
    List<MDepartments> md = <MDepartments>[];
    json['departments'].forEach((v) {
      md.add(MDepartments.formJson(v));
    });

    return MTest1(
      json['isactive'],
      json['name'],
      m,
      MyDateTime.convertDateToFormattedString(json['established']),
      md,
    );
  }
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>>? md = <Map<String, dynamic>>[];
    if (mDepartments!.isNotEmpty && mDepartments != null) {
      mDepartments!.forEach((v) {
        md.add(v.toJson());
      });
    }

    return {
      'isactive': isActive,
      'name': name,
      'adress': adress != null ? adress!.toJson() : null,
      'established': established!,
      'departments': md,
    };
  }
}

class MAdress {
  String? street;
  String? city;
  String? state;
  String? postalCode;
  MAdress(
    this.street,
    this.city,
    this.state,
    this.postalCode,
  );
  factory MAdress.fromJson(Map<String, dynamic> json) {
    return MAdress(
      json['street'],
      json['city'],
      json['state'],
      json['postalcode'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'state': state,
      'postalcode': postalCode,
    };
  }
}

class MDepartments {
  String? deptId;
  String? name;
  String? manager;
  var budget;
  var year;
  MAvailability? mAvailability;
  String? meetingTime;
  MDepartments(
    this.deptId,
    this.name,
    this.manager,
    this.budget,
    this.year,
    this.mAvailability,
    this.meetingTime,
  );
  factory MDepartments.formJson(Map<String, dynamic> json) {
    MAvailability? ma;
    if (json['availability'] != null) {
      ma = MAvailability.formJson(json['availability']);
    } else {
      ma = null;
    }
    return MDepartments(
      json['deptid'],
      json['name'],
      json['manager'],
      json['budget'],
      json['year'] != null ? json['year'] : null,
      ma,
      json['meetingtime'],
    );
  }

  Map<String, dynamic> toJson() {
    // print(mAvailability!.toJson());
    return {
      'deptid': deptId,
      'name': name,
      'manager': manager,
      'budget': budget,
      if (year != null) 'year': year != null ? year : null,
      if (mAvailability != null) 'availability': mAvailability!.toJson(),
      'meetingtime': meetingTime,
    };
  }
}

class MAvailability {
  bool? online;
  bool? inStore;
  MAvailability(this.online, this.inStore);
  factory MAvailability.formJson(Map<String, dynamic> json) {
    return MAvailability(
      json["online"],
      json["instore"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'online': online,
      'instore': inStore,
    };
  }
}
