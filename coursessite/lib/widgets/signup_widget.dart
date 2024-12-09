import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:developer' as developer;

import 'verification_code_widget.dart';

class SignUpWidget extends StatefulWidget {
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _handleSignUp() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final userPool = CognitoUserPool(
        dotenv.env['AWS_USER_POOL_ID']!,
        dotenv.env['AWS_CLIENT_ID']!,
      );

      final userAttributes = [
        AttributeArg(name: 'email', value: _usernameController.text),
      ];

      final signUpResult = await userPool.signUp(
        _usernameController.text,
        _passwordController.text,
        userAttributes: userAttributes,
      );

      if (signUpResult.userConfirmed ?? false) {
        // User is already confirmed, proceed to main screen
        Navigator.of(context).pushReplacementNamed('/main');
      } else {
        final String userEmail = _usernameController.text;
        if (!mounted) return;
        
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Dialog(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: VerificationCodeWidget(
                username: userEmail,  // Make sure to pass the email here
                onVerificationComplete: (code) {
                  Navigator.of(context).pushReplacementNamed('/main');
                },
                onResendCode: () async {
                  // Add resend code logic if needed
                },
              ),
            ),
          ),
        );
      }
    } on CognitoClientException catch (e) {
      developer.log('Cognito error: ${e.code} - ${e.message}');
      setState(() {
        _errorMessage = e.message;
      });
    } catch (e) {
      developer.log('Unexpected error: $e');
      setState(() {
        _errorMessage = 'An unexpected error occurredXXXX. Please try again.';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      type: MaterialType.transparency,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sign Up',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  _errorMessage!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.error,
                  ),
                ),
              ),
            TextFormField(
              controller: _usernameController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: theme.colorScheme.surfaceVariant,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: theme.colorScheme.surfaceVariant,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _isLoading ? null : _handleSignUp,
              child: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text('Sign Up', style: theme.textTheme.labelLarge),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}