import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zimro/cache/cache_helper.dart';
import 'package:zimro/core/api/dio_consumer.dart';
import 'package:zimro/core/api_keys.dart';
import 'package:zimro/core/theme.dart';
import 'package:zimro/features/presentation/cubit/sign_up/SignUp_Cubit.dart';
import 'package:zimro/features/presentation/screens/auth/VerifyEmailScreen.dart';
import 'package:zimro/features/presentation/screens/auth/authScreen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:zimro/features/presentation/screens/auth/signupScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  if (!kIsWeb) {
    Stripe.publishableKey = ApiKeys.publishableKey;
  }

  runApp(
    // DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
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
      home: BlocProvider(
        create: (context) => SignUpCubit(DioConsumer(dio: Dio())),
        child: SignUpScreen(),
      ),
    );
  }
}
