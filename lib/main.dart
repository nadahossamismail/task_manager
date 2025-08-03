import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/features/home/presentation/home_view.dart';
import 'package:task_manager/features/home/presentation/home_viewmodel.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeViewmodel(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomeView()),
    );
  }
}
