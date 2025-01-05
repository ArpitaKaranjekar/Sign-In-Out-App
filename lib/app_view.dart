import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:login_app/screens/auth/home/home_screen.dart';
import 'package:login_app/screens/auth/welcome.dart';
import 'blocs/sign_in_bloc/sign_in_bloc.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firebase Auth',
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
              background: Colors.white,
              onBackground: Colors.black,
              primary: Color.fromRGBO(70, 130, 180, 1),
              onPrimary: Colors.black,
              secondary: Color.fromRGBO(169, 169, 169, 1),
              onSecondary: Colors.white,
              tertiary: Color.fromRGBO(255, 223, 77, 1),
              error: Colors.red,
              outline: Color(0xFF424242)),
        ),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return BlocProvider(
              create: (context) => SignInBloc(
                  userRepository:
                      context.read<AuthenticationBloc>().userRepository),
              child: const HomeScreen(),
            );
          } else {
            return const WelcomeScreen();
          }
        }));
  }
}
