import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:nbu_api/data/models/nbu_class.dart';

class ApiService {
  Future<List<NbuModel>> getAllData() async {
    try {
      Response response =
          await http.get(Uri.parse("https://nbu.uz/uz/exchange-rates/json/"));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<NbuModel> categories = (jsonData as List?)
                ?.map((item) => NbuModel.fromJson(item))
                .toList() ??
            [];
        return categories;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }
}
