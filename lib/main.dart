import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/create_account_screen.dart';
import 'screens/email_input_screen.dart';
import 'screens/password_input_screen.dart';
import 'screens/account_success_screen.dart';
import 'screens/home_screen.dart';
import 'screens/search_doe_screen.dart';
import 'screens/search_results_screen.dart';
import 'screens/part_details_screen.dart';
import 'screens/login_with_email.dart';

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
      routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/createAccount': (context) => CreateAccountScreen(),
        '/emailInput': (context) => EmailInputScreen(),
        '/passwordInput': (context) => PasswordInputScreen(),
        '/accountSuccess': (context) => AccountSuccessScreen(),
        '/home': (context) => HomeScreen(),
        '/searchDOE': (context) => SearchDOEScreen(),
        '/searchResults': (context) => SearchResultsScreen(),
        '/partDetails': (context) => PartDetailsScreen(partDetails: {}), // ✅ Fixed missing argument
        '/loginWithEmail': (context) => LoginWithEmailScreen(),
      },
    );
  }
}
