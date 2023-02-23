import 'package:flutter/material.dart';
import 'package:responsive_product_web_page/pages/product_page.dart';
import 'package:responsive_product_web_page/colors.dart';

import 'pages/collection_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xbox',
      theme: ThemeData(
          unselectedWidgetColor: AppColors.black,
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                    fontSize: 16, fontFamily: "BarlowCondensed")),
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                foregroundColor:
                    MaterialStateProperty.all<Color>(AppColors.black)),
          ),
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: AppColors.green,
              onPrimary: AppColors.white,
              secondary: AppColors.white,
              onSecondary: AppColors.black,
              error: AppColors.red,
              onError: AppColors.white,
              background: AppColors.white,
              onBackground: AppColors.black,
              surface: AppColors.white,
              onSurface: AppColors.black)),
      home: const CollectionsPage(),
    );
  }
}
