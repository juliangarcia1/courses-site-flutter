import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coursessite/core/theme/theme_provider.dart';
import 'package:coursessite/core/services/session_service.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final sessionService = Provider.of<SessionService>(context);
       // Return null if not logged in to disable drawer completely
    // if (!sessionService.isLoggedIn) {
    //   return const SizedBox.shrink();
    // }
 
    return Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Courses Site'),
            ),
            ListTile(
              title: const Text('Courses'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Quizzes'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode
              ),
              title: Text(themeProvider.isDarkMode ? 'Light Mode' : 'Dark Mode'),
              onTap: () {
                themeProvider.toggleTheme();
              },
            ),
            ListTile(
              leading: Icon(sessionService.isLoggedIn ? Icons.logout : Icons.login),
              title: Text(sessionService.isLoggedIn ? 'Logout' : 'Login'),
              onTap: () {
                if (sessionService.isLoggedIn) {
                  sessionService.logout();
                  Navigator.pushReplacementNamed(context, '/signin');
                } else {
                  Navigator.pushReplacementNamed(context, '/signin');
                }
              },
            ),
          ],
        ),
      );
  }
}