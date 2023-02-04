import 'package:doc/main_layout.dart';
import 'package:doc/screens/appointment_page.dart';
import 'package:doc/screens/auth_page.dart';
import 'package:doc/screens/booking_page.dart';
import 'package:doc/screens/doctor_details.dart';
import 'package:doc/utils/config.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // this is for push navigator
  static final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
      //define ThemeData here
    return MaterialApp(
      title: 'Flutter Doctor App',
      theme: ThemeData(
        //pre-define input decoration
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: Config.primaryColor,
          border: Config.outlinedBorder,
          focusedBorder: Config.focusBorder,
          errorBorder: Config.errorBorder,
          enabledBorder: Config.outlinedBorder,
          floatingLabelStyle: TextStyle(color: Config.primaryColor),
          prefixIconColor: Colors.black38
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Config.primaryColor,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey.shade700,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      initialRoute: '/',
      routes: {
        //whitch is auth page login and signup
        '/': (context) => const AuthPage(),
        'doc_details': (context) => const DoctorDetails(),
        'booking_page': (context) =>  BookingPage(),
        'success_booking': (context) =>  AppointmentPage(),
      },
    );
  }
}
