import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendex_app/core/local_data/shared_pref_helper.dart';
import 'package:sendex_app/core/routing/app_router.dart';

import 'core/utils/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isLoggedIn =
      await SharedPrefsHelper.getBool(Strings.isUserLogged) ?? false;
  runApp(MyApp(
    isLoggedIn: isLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Sendex app',
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
          scaffoldBackgroundColor: Colors.white,
        ),
        onGenerateRoute: AppRouter().generateRoutes,
        debugShowCheckedModeBanner: false,
        initialRoute: isLoggedIn ? Strings.loginScreen : Strings.loginScreen,
      ),
    );
  }
}
