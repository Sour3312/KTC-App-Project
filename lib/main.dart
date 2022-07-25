// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ktc_booking/src/config/routes/ktc_routes.dart';
import 'package:flutter_ktc_booking/src/injector.dart';
import 'package:flutter_ktc_booking/src/presentation/widgets/home_widget.dart';
import 'package:flutter_ktc_booking/src/utils/ktc_colors.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialiseDependency();
  FlavorConfig(
      name: "DEVELOP",
      color: Colors.red,
      location: BannerLocation.bottomStart,
      variables: {
        "counter": 0,
        "baseUrl": "https://www.example.com",
      });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KTC India',
      onGenerateRoute: KTCRoutes.onGenerateRoutes,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: KTCColors.primaryColor,
            elevation: 0,
          ),
          brightness: Brightness.light),
      home: HomeWidget(),
    );
  }
}
