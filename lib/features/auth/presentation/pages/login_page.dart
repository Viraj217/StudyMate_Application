/*

LOGIN PAGE UI

On this page the user can login eith thier
-email
-pw

one logged in send them to the homepage
if doesnt have a acc then register at the regi page to create one

 */

import 'package:flutter/material.dart';
import 'package:uc_task_1/features/auth/presentation/components/my_button.dart';
import 'package:uc_task_1/features/auth/presentation/components/my_textfield.dart';

class LoginPage extends StatefulWidget {

  final void Function()? togglePages;


  const LoginPage({super.key, required this.togglePages});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //text controlle
  final emailController = TextEditingController();
  final pwController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Icon(
                Icons.menu_book,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),

              const SizedBox(height: 25,),
              //name of the app
              Text("S T U D Y M A T E",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

              const SizedBox(height: 25,),

              //email txtfld
              MyTextfield(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
              ),

              const SizedBox(height: 10,),

              //forgot pw
              MyTextfield(
                  controller: pwController,
                  hintText: "Password",
                  obscureText: true,
              ),

              const SizedBox(height: 10,),

              //forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25,),

              //login button
              MyButton(
                onTap: (){},
                text: "Login",
              ),

              const SizedBox(height: 25,),

              //other sign in option

              //register button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                  ),
                  GestureDetector(
                    onTap: widget.togglePages,
                    child: Text(
                      "Register now",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
