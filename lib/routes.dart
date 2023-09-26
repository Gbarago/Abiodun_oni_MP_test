import 'package:abiodun_mobile/data/product_data.dart';
import 'package:abiodun_mobile/providers/nav_provider.dart';
import 'package:abiodun_mobile/providers/product_peovider.dart';
import 'package:abiodun_mobile/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/calculate_views/calculate_summary_screen.dart';
import 'views/dashboard_screen.dart';
import 'views/product_search_page.dart';

class Routes {
  static const String dashboard = '/';
  static const String home = 'home';
  static const String searchProductsScreen = 'search_product_screen';
  static const String calculateSummary = 'calculate_summary_screen.dart';

  // static const String home = '/home';

  // static const String home = '/home';
  // static const String onboarding = '/onboarding';
  // static const String signUpEnterPhone = '/signUp_enter_phone_number';
  // static const String signUpFormScreen = '/signUp_fortm_screen';

  static final Map<String, WidgetBuilder> routes = {
    // dashboard: (context) => ChangeNotifierProvider(
    //       create: (context) => TabProvider(),
    //       child:const DashboardScreen(),
    //     ),

    // calculateSummary: (context) => ChangeNotifierProvider(
    //       create: (context) => TabProvider(),
    //       child: CalculateSummaryScreen(),
    //     ),

    dashboard: (context) => const DashboardScreen(),

    calculateSummary: (context) => const CalculateSummaryScreen(),

    home: (context) => const MyHomePage(),

    searchProductsScreen: (context) => ChangeNotifierProvider(
          create: (context) => ProductProvider(productsList),
          child: ProductSearchPage(),
        ),
  };
}
