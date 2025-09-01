import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uc_task_1/features/auth/presentation/components/loading.dart';
import 'package:uc_task_1/features/auth/presentation/cubits/auth_states.dart';
import 'package:uc_task_1/features/auth/presentation/pages/auth_page.dart';
import 'package:uc_task_1/firebase_options.dart';
import 'package:uc_task_1/themes/light_mode.dart';
import 'features/auth/data/firebase_auth_repo.dart';
import 'features/auth/presentation/cubits/auth_cubits.dart';
import 'features/home/presentation/pages/home_page.dart';


void main() async{
  //firebase setup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //run application
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  //auth repo
  final firebaseAuthRepo = FirebaseAuthRepo();


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      //provide cubits to the app
        providers: [
          //auth cubit
          BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(authRepo: firebaseAuthRepo)..checkAuth(),
          ),
        ],

        //app
        child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: lightMode,
                /*
                BLOC CONSUMER - Auth
                */
                home: BlocConsumer<AuthCubit, AuthState>(
                  builder: (context, state){
                    print(state);
                    //unauthenticated -> auth page
                    if (state is UnAuthenticated) {
                      return AuthPage();
                    }
                    //authenticated -> home page
                    if (state is Authenticated) {
                      return HomePage();
                    }
                    //loadig..
                    else {
                      return LoadingScreen();
                    }

                  },
                  listener: (context, state){
                    //auth error
                    if (state is AuthError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                ),
        ),
    );
  }
}
