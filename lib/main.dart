
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'config/hive_service/hive_service.dart';
import 'config/setup.dart';
import 'screens/home/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding();
  await HiveServices.init();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(460, 1046),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context, child) {
        return const GetMaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('fa', 'IR'),
          ],
          locale: Locale('fa', 'IR'),

          color: Colors.white,
          debugShowCheckedModeBanner: false,
          title: 'GymJibi',
          home: Homescreen(),

        );
      }
    );
  }
}


