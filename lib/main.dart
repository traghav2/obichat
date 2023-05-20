import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obichat/cubits/auth_cubits/auth_cubit.dart';
import 'package:obichat/cubits/auth_cubits/auth_state.dart';
import 'package:obichat/firebase_options.dart';
import 'package:obichat/screens/auth/login_screen.dart';
import 'package:obichat/screens/auth/welcome_screen.dart';
import 'package:obichat/screens/home_screen.dart';
import 'package:obichat/screens/splash_screen.dart';
import 'package:obichat/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ObiChat',
        theme: AppTheme.dark(ThemeData.dark()),
        darkTheme: AppTheme.dark(ThemeData
            .dark()), // Set the dark theme// Set the initial theme mode to dark
        home: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (oldState, newState) {
            return oldState is AuthInitialState;
          },
          builder: (context, state) {
            if (state is AuthLoggedInState) {
              return HomeScreen();
            } else if (state is AuthLoggedOutState) {
                return const WelcomeScreen();
            }else{
              return const SplashScreen();
            }
          },
        ),
      ),
    );
  }
}
