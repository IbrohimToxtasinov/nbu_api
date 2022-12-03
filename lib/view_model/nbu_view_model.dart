import 'package:flutter/foundation.dart';
import 'package:nbu_api/data/models/nbu_class.dart';
import 'package:nbu_api/data/repositories/app_repositories.dart';

class NbuViewModel extends ChangeNotifier {
  NbuViewModel({required AppRepository appRepository}) {
    _appRepository = appRepository;
  }

  late AppRepository _appRepository;

  bool isLoading = false;

  List<NbuModel> data = [];

  fetchNbuData() async {
    notify(true);
    data = await _appRepository.getNbuData();
    notify(false);
  }

  notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
