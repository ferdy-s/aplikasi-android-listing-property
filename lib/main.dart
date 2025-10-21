// main.dart
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/details_screen.dart';
import 'models/property.dart';

void main() => runApp(const TownzHubApp());

class TownzHubApp extends StatelessWidget {
  const TownzHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TownzHub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/details') {
          final property = settings.arguments as Property;
          return PageRouteBuilder(
            pageBuilder: (_, __, ___) => DetailsScreen(property: property),
            transitionsBuilder: (_, anim, __, child) => FadeTransition(
              opacity: anim,
              child: child,
            ),
          );
        }
        return null;
      },
    );
  }
}
