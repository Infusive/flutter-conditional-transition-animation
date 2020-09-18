import 'package:flutter/material.dart';
import 'package:after_solution/routes.dart' as Routes;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter conditional transitions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.myOnGenerateRoute,
      initialRoute: Routes.MyRoute.homePage,
    );
  }
}
