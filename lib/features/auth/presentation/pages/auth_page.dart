/*
determines if to show login or register page
 */


import 'package:flutter/material.dart';
import 'package:uc_task_1/features/auth/presentation/pages/register_page.dart';
import 'login_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool showLoginPage = true;

  //toggle between pages
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }


  @override
  Widget build(BuildContext context) {
    if(showLoginPage) {
     return LoginPage(togglePages: togglePages,);
    } else{
      return RegisterPage(togglePages: togglePages,);
    }
  }
}
