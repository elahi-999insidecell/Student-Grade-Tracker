import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:studentgradetracker/Theme/customapptheme.dart';
import 'package:studentgradetracker/providers/subject_provider.dart';
import 'package:studentgradetracker/providers/thema.dart';
import 'package:studentgradetracker/screens/navigation_provider.dart';
import 'package:studentgradetracker/screens/navigation_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themprovider = Thema();
  await themprovider.loadTheme();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: themprovider),
        ChangeNotifierProvider(create: (_) => SubjectProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeprovider = context.watch<Thema>();
    return MaterialApp.router(
      title: 'Student Grade Tracker',
      debugShowCheckedModeBanner: false,
      theme:AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeprovider.isDark ? ThemeMode.dark : ThemeMode.light,
      routerConfig: appRouter,
    );
  }
}

final GoRouter appRouter = GoRouter(routes: [

   GoRoute(path: "/", builder: (context, state) => NavigationScreen()),
]);

