import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:coursessite/features/articles/presentation/pages/landpage/landpage.dart';
import 'package:coursessite/features/authentication/presentation/confirm_reset_password.dart';
import 'package:provider/provider.dart';
import 'package:coursessite/features/authentication/presentation/sign_in.dart';
import 'package:coursessite/widgets/verification_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:coursessite/core/theme/theme_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/services/session_service.dart';

import 'features/articles/presentation/pages/common/custom_drawer.dart';
import 'features/articles/presentation/pages/course/course.dart';
import 'features/authentication/presentation/reset_password.dart';
import 'features/authentication/presentation/sign_up.dart';
import 'src/courses_def.dart' as config;
import 'features/quiz/presentation/pages/quiz.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    print('Error loading .env file: $e');
    // Provide fallback values or handle error
  }
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => SessionService()),
      ],
      builder: (context, _) {
        final sessionService = Provider.of<SessionService>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Courses Site',
          themeMode: context.watch<ThemeProvider>().themeMode,
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
            body: sessionService.isLoggedIn ? const Landpage() : const SignIn(),
            drawer: sessionService.isLoggedIn ? const CustomDrawer() : null,
          ),
          routes: {
            '/landpage': (context) => const Landpage(),
            '/signin': (context) => const SignIn(),
            '/signup': (context) => const SignUp(),
            '/reset-password': (context) => const ResetPassword(),
            '/course': (context) =>
                const Course(courseName: 'Python', steps: 'pythonBasicsSteps'),
            '/quiz': (context) => const Quiz(),
            '/verify-email': (context) => VerificationCodeWidget(
                  onVerificationComplete: (String verificationCode) async {
                  try {
                    final cognitoUser = CognitoUser(
                    '',
                    CognitoUserPool(
                      dotenv.env['AWS_USER_POOL_ID']!,
                      dotenv.env['AWS_CLIENT_ID']!,
                    ),
                    );
                    final result = await cognitoUser.confirmRegistration(
                    verificationCode,
                    forceAliasCreation: true,
                    );
                    if (result == 'SUCCESS') {
                    debugPrint('Verification successful');
                    } else {
                    debugPrint('Verification failed');
                    }
                  } catch (e) {
                    debugPrint('Error during verification: $e');
                  }
                  },
                  username: ModalRoute.of(context)!.settings.arguments as String,
            ),
            '/confirm-reset': (context) => const ConfirmResetPassword(),
            for (var i = 0; i < config.pythonCourses.length; i++)
              '/${config.pythonCourses[i]['sluggedName']}': (context) => Course(
                    courseName: config.pythonCourses[i]['slugedName'].toString(),
                    steps: config.pythonCourses[i]['stepsName'].toString(),
                  ),
          },
        );
      },
    );
  }
}