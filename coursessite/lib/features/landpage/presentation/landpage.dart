import 'package:flutter/material.dart';
import 'package:coursessite/core/services/cognito_service.dart';
import 'package:coursessite/features/articles/presentation/pages/common/custom_drawer.dart';

class LandPage extends StatefulWidget {
  const LandPage({super.key});

  @override
  State<LandPage> createState() => _LandPageState();
}

class _LandPageState extends State<LandPage> {
  final _cognitoService = CognitoService();

  Future<void> _handleSignOut() async {
    try {
      await _cognitoService.signOut();
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/signin');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing out: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _handleSignOut,
            tooltip: 'Sign Out',
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: // ...existing body code...
    );
  }
}