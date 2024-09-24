import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_todo/core/blocs/language/language_cubit.dart';
import 'package:flutter_bloc_todo/core/constants/localization_constant.dart';
import 'package:flutter_bloc_todo/core/injection/injection.dart';
import 'package:flutter_bloc_todo/core/blocs/todo/todo_cubit.dart';
import 'package:flutter_bloc_todo/features/todo/ui/todo_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void initialEasyLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.white
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..indicatorSize = 36
    ..indicatorColor = Colors.purple
    ..textColor = Colors.grey
    ..textStyle = const TextStyle(fontSize: 16, color: Colors.grey)
    ..maskType = EasyLoadingMaskType.custom
    ..maskColor = Colors.black.withOpacity(0.5)
    ..radius = 999
    ..dismissOnTap = false
    ..userInteractions = false
    ..contentPadding = const EdgeInsets.all(30);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initialInjection();
  initialEasyLoading();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TodoCubit()),
        BlocProvider(create: (_) => LanguageCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Bloc Todo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          locale: state.locale,
          supportedLocales: const [
            Locale(LocalizationConstant.localeENCode),
            Locale(LocalizationConstant.localeTHCode),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          builder: EasyLoading.init(),
          home: const TodoScreen(),
        );
      },
    );
  }
}
