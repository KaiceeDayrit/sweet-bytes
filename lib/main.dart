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
        if (settings.name == '/loading') {
          final args = settings.arguments as Map<String, dynamic>?;
          final nextRoute = args?['next'] ?? '/home';

          return MaterialPageRoute(
            builder: (context) => LoadingScreen(nextRoute: nextRoute),
          );
        }

        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const TapToContinue());
          case '/login':
            return MaterialPageRoute(builder: (_) => const Login());
          case '/signup':
            return MaterialPageRoute(builder: (_) => const SignUp());
          case '/forgot-password':
            return MaterialPageRoute(builder: (_) => const ForgetPassword());
          case '/home':
            return MaterialPageRoute(builder: (_) => const Home());
          case '/search':
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (_) => Search(
                title: args['title'],
                imagePath: args['imagePath'],
              ),
            );
          case '/profile':
            return MaterialPageRoute(builder: (_) => const Profile());
          case '/diary':
            return MaterialPageRoute(builder: (_) => const Diary());
          case '/weather':
            return MaterialPageRoute(builder: (_) => const Weather());
          default:
            return MaterialPageRoute(
              builder: (_) => Scaffold(
                body: Center(child: Text('Unknown route: ${settings.name}')),
              ),
            );
        }
      },
    );
  }
}
