import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fruit_hub_dashboard/core/router/app_router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'Cairo',
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      title: 'fruit hub dashboard',
    );
  }
}
