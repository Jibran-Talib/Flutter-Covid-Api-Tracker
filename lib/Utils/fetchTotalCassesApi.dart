import 'dart:convert';
import 'package:covid_tracker/Modles/TotalCasesModle.dart';
import 'package:covid_tracker/Utils/App_Url.dart';
import 'package:http/http.dart' as http;

class StateServices {
  Future<TotalCasesModle> fetchWorldApi() async {
    final response = await http.get(Uri.parse(AppUrl.WorldStateApi));
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return TotalCasesModle.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }

  Future<List<dynamic>> WorldlistApi() async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.CountriesListApi));
    data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception("Error");
    }
  }
}
