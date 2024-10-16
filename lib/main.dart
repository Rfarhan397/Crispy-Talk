import 'package:crispytalk/model/res/routes/routes.dart';
import 'package:crispytalk/model/res/routes/routes_name.dart';
import 'package:crispytalk/provider/action/action_provider.dart';
import 'package:crispytalk/provider/bottomNavBar/bottomNavBarProvider.dart';
import 'package:crispytalk/provider/notification/notificationProvider.dart';
import 'package:crispytalk/provider/passwpordVisibility/passwordVisibilityProvider.dart';
import 'package:crispytalk/provider/theme/theme_provider.dart';
import 'package:crispytalk/provider/user_provider/user_provider.dart';
import 'package:crispytalk/screens/splash/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeLanguageProvider()),
        ChangeNotifierProvider(create: (_) => PasswordVisibilityProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavBarProvider()),
        ChangeNotifierProvider(create: (_) => ActionProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
      ],
      child: Sizer(
          builder: (context, orientation, deviceType) {
            return  GetMaterialApp(
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white
              ),
              debugShowCheckedModeBanner: false,
                title: 'Crispy Talk',
                initialRoute: RoutesName.splashScreen,
              getPages: Routes.routes,
            );
          }
      ),
    );
      

  }
}

