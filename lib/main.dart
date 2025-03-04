import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:multi_store/resource/lang/translate_service.dart';
import 'package:multi_store/resource/theme/app_colors.dart';
import 'package:multi_store/resource/theme/app_theme.dart';
import 'package:multi_store/routes/app_routes.dart';


import 'app/app_bindings.dart';
import 'common/constants.dart';


Future<void> main() async {
  await init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const App(initialRoute: PageName.splashPage));
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..maxConnectionsPerHost = 6
      ..connectionTimeout = const Duration(minutes: 1)
      ..idleTimeout = const Duration(minutes: 1)
      ..badCertificateCallback = (_, __, ___) => true;
  }
}
class App extends StatelessWidget {
  final String initialRoute;

  const App({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 823),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      rebuildFactor: RebuildFactors.orientation,
      fontSizeResolver: FontSizeResolvers.height,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeftWithFade,
        getPages: AppPages.routes,
        initialBinding: AppBindings(),
        smartManagement: SmartManagement.keepFactory,
        title: Constants.appName,
        locale: TranslationService.locale,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        fallbackLocale: TranslationService.fallbackLocale,
        translations: TranslationService(),
        initialRoute: initialRoute,
        theme: AppTheme.light,
        darkTheme: AppTheme.light,
      ),
    );
  }
}