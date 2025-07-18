import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sahel/features/auth/presentation/pages/forget_pass_screen.dart';
import 'package:sahel/features/auth/presentation/pages/login_screen.dart';
import 'package:sahel/features/auth/presentation/pages/register_screen.dart';
import 'package:sahel/provider/language_provider.dart';

import 'config/routing/routes.dart';
import 'core/helpers/bloc_observer.dart';
import 'core/l10n/translations/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();

  runApp(
    ChangeNotifierProvider(
      create: (_) => AppLanguageProvider(),
      child: const Saai(),
    ),
  );
}

class Saai extends StatelessWidget {
  const Saai({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        locale: Locale(languageProvider.appLanguage),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.loginRoute: (_) => const LoginScreen(),
          AppRoutes.registerRoute: (_) => const RegisterScreen(),
          AppRoutes.forgetPasswordRoute: (_) => const ForgetPassScreen(),
        },
        initialRoute: AppRoutes.loginRoute,
        // theme: AppTheme.lightTheme,
      ),
    );
  }
}
