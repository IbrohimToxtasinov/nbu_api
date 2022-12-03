import 'package:nbu_api/data/api_service/api_service.dart';
import 'package:nbu_api/data/models/nbu_class.dart';

class AppRepository {
  AppRepository({
    required ApiService apiService,
  }) {
    _apiService = apiService;
  }

  late ApiService _apiService;

  Future<List<NbuModel>> getNbuData() => _apiService.getAllData();
}