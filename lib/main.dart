//package
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
//flutter
import 'package:flutter/material.dart';
import 'package:paneasy/I10n/l10n.dart';
import 'package:paneasy/provider/local_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:paneasy/theme/nativeTheme.dart';
import 'package:paneasy/utils/binding.dart';

//views
import 'package:paneasy/views/Splash/splash_screen.dart';

//theme
//controller
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(ChangeNotifierProvider(
    create: (_) => LocaleProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: Get.key,
        enableLog: true,
        theme: nativeTheme(),
        initialBinding: NetworkBinding(),
        locale: provider.locale,
        title: 'Flutter Demo',
        supportedLocales: L10n.all,
        localizationsDelegates: [
          // AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        initialRoute: "SplashScreen",
        home: SplashScreen());
  }
}
