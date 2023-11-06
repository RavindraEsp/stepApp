import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:step_app/bottomNavigation/bottom_navigation.dart';
import 'package:step_app/helper/common_method.dart';
import 'package:step_app/modules/home/home_screen_provider.dart';
import 'package:step_app/dashboard/second_screen.dart';

import 'dashboard/home_screen.dart';
import 'modules/auth/selectCountry/select_country_screen.dart';
import 'modules/intro/intro_screen.dart';
import 'modules/settings/termCondition/term_condition_screen.dart';
import 'modules/splash/splash_screen.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),

        // splitScreenMode: true,
        builder: (context, child) {
          return   MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                // This is the theme of your application.
                //
                // TRY THIS: Try running your application with "flutter run". You'll see
                // the application has a blue toolbar. Then, without quitting the app,
                // try changing the seedColor in the colorScheme below to Colors.green
                // and then invoke "hot reload" (save your changes or press the "hot
                // reload" button in a Flutter-supported IDE, or press "r" if you used
                // the command line to start the app).
                //
                // Notice that the counter didn't reset back to zero; the application
                // state is not lost during the reload. To reset the state, use hot
                // restart instead.
                //
                // This works for code too, not just values: Most code changes can be
                // tested with just a hot reload.
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              // home: const HomeScreen(),
              // home: const BottomNavigationWidget(),
              home: MultiProvider(
                providers: [
                  ChangeNotifierProvider(create: (_) => HomeScreenProvider()),

                ],
                // child: const BottomNavigationWidget(),
             //   child: const IntroScreen(),
                child: const SelectCountryScreen(),
              //  child: const TermConditionScreen(),
              )
          );
        });


  }
}





