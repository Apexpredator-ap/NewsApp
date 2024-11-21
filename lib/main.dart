import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/settings_cubit/setting_cubit.dart';
import 'package:newsapp/splash/splash_screen.dart';
import 'package:newsapp/ui/home/articals_details/articals_details.dart';
import 'package:newsapp/ui/home/home_screen.dart';

import 'core/theme/my_theme_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settingCubit = SettingCubit();
  await settingCubit.getLang();
  runApp(BlocProvider(create: (_) => settingCubit, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      theme: AppTheme.appTheme,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        ArticalDetails.routeName: (_) => const ArticalDetails(),
      },
    );
  }
}
