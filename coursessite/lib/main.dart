import 'package:coursessite/features/articles/presentation/pages/landpage/landpage.dart';
import 'package:coursessite/features/authentication/presentation/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coursessite/core/theme/theme_provider.dart';

import 'features/articles/presentation/pages/common/custom_drawer.dart';
import 'features/articles/presentation/pages/course/course.dart';
// import 'pages/landpage.dart';
// import 'src/courses_def.dart' as config show _resources,  siteName;
import 'features/articles/presentation/pages/login/login.dart';
import 'features/authentication/presentation/reset_password.dart';
import 'features/authentication/presentation/sign_up.dart';
import 'src/courses_def.dart' as config;
import 'features/quiz/presentation/pages/quiz.dart';

void main(List<String> args) {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final bool _isLogged = false;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Courses Site',
        themeMode: Provider.of<ThemeProvider>(context).themeMode,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Courses Site'),
          ),
          body: const Landpage(),
          drawer: const CustomDrawer(),
        ),
        routes: {
          '/landpage': (context) => const Landpage(),
          '/signin': (context) => const SignIn(),
          '/signup': (context) => const SignUp(),
          '/reset-password': (context) => const ResetPassword(),
          '/course': (context) =>
              const Course(courseName: 'Python', steps: 'pythonBasicsSteps'),
          '/quiz': (context) => const Quiz(),
          // for over config.pythonCourse
          for (var i = 0; i < config.pythonCourses.length; i++)
            '/${config.pythonCourses[i]['sluggedName']}': (context) => Course(
                  courseName: config.pythonCourses[i]['slugedName'].toString(),
                  steps: config.pythonCourses[i]['stepsName'].toString(),
                ),
        },
      ),
    );
  }
}