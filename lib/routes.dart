import 'package:abiodun_mobile/data/product_data.dart';
import 'package:abiodun_mobile/providers/nav_provider.dart';
import 'package:abiodun_mobile/providers/product_peovider.dart';
import 'package:abiodun_mobile/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/dashboard_screen.dart';
import 'views/product_search_page.dart';

class Routes {
  static const String dashboard = '/';
  static const String home = 'home';

  static const String searchProductsScreen = 'search_product_screen';

  // static const String home = '/home';
  // static const String onboarding = '/onboarding';
  // static const String signUpEnterPhone = '/signUp_enter_phone_number';
  // static const String signUpFormScreen = '/signUp_fortm_screen';
  // static const String uploadImageScreen = '/uploadImageScreens_screen';
  // static const String uploadSuccessScreen = '/upload_success';
  // static const String loginScreen = '/login_screen';
  // static const String dashboardScreen = '/dashboard_screen';
  // static const String forgotPasswordScreen = '/forgot_password_screen';

  static final Map<String, WidgetBuilder> routes = {
    dashboard: (context) => ChangeNotifierProvider(
          create: (context) => TabProvider(),
          child: DashboardScreen(),
        ),

    home: (context) => MyHomePage(),

    searchProductsScreen: (context) => ChangeNotifierProvider(
          create: (context) => ProductProvider(productsList),
          child: ProductSearchPage(),
        ),

    // signUpEnterPhone: (context) => ChangeNotifierProvider(
    //       create: (context) => SignupProvider(),
    //       child: SignupEnterPhoneNumberScreen(),
    //     ),
    // signUpFormScreen: (context) => SignUpFormScreen(),
    // uploadImageScreen: (context) => UploadPhotoSvreen(),
    // uploadSuccessScreen: (context) => UploadSuccessScreen(),
    // loginScreen: (context) => LoginScreen(),

    // dashboardScreen: (context) => DashboardScreen(),

    // forgotPasswordScreen: (context) => ForgotPasswordScreen(),

    /// settings: (context) => SettingsScreen(),
  };
}
