import 'package:assessment/shared/constants/colors.dart';
import 'package:assessment/shared/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Transparent Status Bar
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light
  ));

  // Also for Bottom Android Button
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: [SystemUiOverlay.top]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: mainAppColor,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}