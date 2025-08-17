import 'package:flutter/material.dart';
import 'tabtocontinue.dart';
import 'login.dart';
import 'signup.dart';
import 'loading.dart';
import 'forgetpassword.dart';
import 'home.dart';
import 'search.dart';
import 'profile.dart';
import 'diary.dart';
import 'weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const TapToContinue());

          case '/login':
            return MaterialPageRoute(builder: (_) => const Login());

          case '/signup':
            return MaterialPageRoute(builder: (_) => const SignUp());

          case '/forgot-password':
            return MaterialPageRoute(builder: (_) => const ForgetPassword());

          case '/loading':
            final args = settings.arguments as Map<String, dynamic>?;

            return MaterialPageRoute(
              builder: (_) => LoadingScreen(
                nextRoute: args?['next'] ?? '/home',
              ),
            );

          case '/home':
            return MaterialPageRoute(builder: (_) => const Home());

          case '/search':
            final args = settings.arguments;
            if (args is Map<String, dynamic> &&
                args.containsKey('title') &&
                args.containsKey('imagePath')) {
              return MaterialPageRoute(
                builder: (_) => SearchScreen(
                  title: args['title'],
                  imagePath: args['imagePath'],
                ),
              );
            }
            return _errorRoute('Missing or invalid arguments for /search');

          case '/profile':
            return MaterialPageRoute(builder: (_) => const Profile());

          case '/diary':
            return MaterialPageRoute(builder: (_) => const Diary());

          case '/weather':
            return MaterialPageRoute(builder: (_) => const Weather());

          default:
            return _errorRoute('Unknown route: ${settings.name}');
        }
      },
    );
  }

  MaterialPageRoute _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Navigation Error')),
        body: Center(child: Text(message)),
      ),
    );
  }
}
