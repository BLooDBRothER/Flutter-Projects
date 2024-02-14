import 'package:flutter/material.dart';

import 'package:expense_app/widgets/expense_home.dart';
import 'package:flutter/services.dart';


var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 176, 242, 233));
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Colors.blueGrey
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  bool isDark = true;

  void _toggleTheme() {
    print(isDark);

    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.onPrimary,
          foregroundColor: kDarkColorScheme.tertiary
        ),
        navigationBarTheme: const NavigationBarThemeData().copyWith(
          backgroundColor: kDarkColorScheme.onPrimary,
          indicatorColor: kDarkColorScheme.tertiary.withOpacity(0.2)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.onPrimaryContainer,
            foregroundColor: kDarkColorScheme.primaryContainer
          )
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: kDarkColorScheme.secondary
          )
        ),
        snackBarTheme: const SnackBarThemeData().copyWith(
          backgroundColor: kDarkColorScheme.onPrimaryContainer
        ),
        iconTheme: const IconThemeData().copyWith(
          color: kDarkColorScheme.tertiary
        )
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimary,
          foregroundColor: kColorScheme.tertiary
        ),
        navigationBarTheme: const NavigationBarThemeData().copyWith(
          backgroundColor: kColorScheme.onPrimary,
          indicatorColor: kColorScheme.tertiary.withOpacity(0.2)
        ),
        bottomSheetTheme: const BottomSheetThemeData().copyWith(
          modalBackgroundColor: Colors.white
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer
          )
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black
          )
        ),
        snackBarTheme: const SnackBarThemeData().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer
        ),
        iconTheme: const IconThemeData().copyWith(
          color: kColorScheme.tertiary
        )
      ),
      home: Expenses(isDark: isDark, toggleThem: _toggleTheme,),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
