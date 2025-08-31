import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uc_task_1/features/auth/presentation/pages/auth_page.dart';
import 'package:uc_task_1/features/auth/presentation/pages/login_page.dart';
import 'package:uc_task_1/features/auth/presentation/pages/register_page.dart';
import 'package:uc_task_1/firebase_options.dart';
import 'package:uc_task_1/themes/light_mode.dart';
import 'package:uc_task_1/features/auth/presentation/pages/login_page.dart';


void main() async{
  //firebase setup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //run application
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      theme: lightMode,
    );
  }
}
