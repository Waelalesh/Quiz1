import 'package:dart_advanced_modeling/features/q1/data/models/date_time_mixin.dart';

class AiModelTest {
  AiCompany? aiCompany;

  AiModelTest({this.aiCompany});

  AiModelTest.fromJson(Map<String, dynamic> json) {
    aiCompany =
        json['company'] != null ? AiCompany.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (aiCompany != null) {
      data['company'] = aiCompany!.toJson();
    }
    return data;
  }
}

class AiCompany {
  int? isActive;
  String? name;
  Address? address;
  String? established;
  List<Departments>? departments;

  AiCompany(
      {this.isActive,
      this.name,
      this.address,
      this.established,
      this.departments});

  AiCompany.fromJson(Map<String, dynamic> json) {
    isActive = json['is_active'] ?? 1;
    name = json['name'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    established = MyDateTime.convertDateToFormattedString(json['established']);
    if (json['departments'] != null) {
      departments = <Departments>[];
      json['departments'].forEach((v) {
        departments!.add(Departments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_active'] = isActive;
    data['name'] = name;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['established'] = established;
    if (departments != null) {
      data['departments'] = departments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  String? street;
  String? city;
  String? state;
  String? postalCode;

  Address({this.street, this.city, this.state, this.postalCode});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postalCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = street;
    data['city'] = city;
    data['state'] = state;
    data['postalCode'] = postalCode;
    return data;
  }
}

class Departments {
  String? deptId;
  String? name;
  String? manager;
  double? budget;
  int? year;
  Availability? availability;
  String? meetingTime;

  Departments(
      {this.deptId,
      this.name,
      this.manager,
      this.budget,
      this.year,
      this.availability,
      this.meetingTime});

  Departments.fromJson(Map<String, dynamic> json) {
    deptId = json['deptId'];
    name = json['name'];
    manager = json['manager'];
    budget = json['budget'];
    year = json['year'];
    availability = json['availability'] != null
        ? Availability.fromJson(json['availability'])
        : null;
    meetingTime = json['meeting_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deptId'] = deptId;
    data['name'] = name;
    data['manager'] = manager;
    data['budget'] = budget;
    data['year'] = year;
    if (availability != null) {
      data['availability'] = availability!.toJson();
    }
    data['meeting_time'] = meetingTime;
    return data;
  }
}

class Availability {
  bool? online;
  bool? inStore;

  Availability({this.online, this.inStore});

  Availability.fromJson(Map<String, dynamic> json) {
    online = json['online'];
    inStore = json['inStore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['online'] = online;
    data['inStore'] = inStore;
    return data;
  }
}
