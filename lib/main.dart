import 'package:zimro/core/api_keys.dart';
import 'package:zimro/core/theme.dart';
import 'package:zimro/features/presentation/screens/auth/authScreen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    Stripe.publishableKey = ApiKeys.publishableKey;
  }

  runApp(
    // DevicePreview(enabled: !kReleaseMode, builder: (context) =>
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Fashion App',
      themeMode: ThemeMode.dark,
      darkTheme: AppThemes.dark,
      home: AuthScreen(),
    );
  }
}
