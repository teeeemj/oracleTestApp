import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/core/config/routes/app_router.dart';

import 'core/data/user_data.dart';

void main(List<String> args) {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().config(),
    );
  }
}
