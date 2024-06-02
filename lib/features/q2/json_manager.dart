import 'package:dart_advanced_modeling/helper/helper_method.dart';

class JsonManagerSingelton {
  static final JsonManagerSingelton _jsonManager = JsonManagerSingelton._internal();
  factory JsonManagerSingelton() => _jsonManager;
  JsonManagerSingelton._internal();
  List<String>? _categories;
  List<String>? _venues;
  List<String>? _languages;

  Future<List<String>> getCategoriesData() async {
    _categories ??= await HelperMethod.getCategories();
    return _categories!;
  }

  Future<List<String>> getVenuesData() async {
    _venues ??= await HelperMethod.getVenues();

    return _venues!;
  }

  Future<List<String>> getLanguagesData() async {
    _languages ??= await HelperMethod.getLanguages();
    return _languages!;
  }
}
