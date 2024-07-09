import 'package:get/get.dart';
import 'package:timbu_mobile_app/util/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:timbu_mobile_app/views/home_page.dart';
import 'package:timbu_mobile_app/views/single_product.dart';

void main() async {
  // Load the environment variables
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Flutter App',
      themeMode: ThemeMode.system,
      theme: MyAppTheme.lightTheme,
      darkTheme: MyAppTheme.darkTheme,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const ProductScreen(),
      },
    );
  }
}
