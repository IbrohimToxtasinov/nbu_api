import 'package:flutter/material.dart';
import 'package:nbu_api/data/api_service/api_service.dart';
import 'package:nbu_api/data/repositories/app_repositories.dart';
import 'package:nbu_api/screens/home_page.dart';
import 'package:nbu_api/view_model/nbu_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  AppRepository appRepository = AppRepository(apiService: ApiService());
  NbuViewModel nbuViewModel = NbuViewModel(appRepository: appRepository);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => nbuViewModel),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      
    );
  }
}
