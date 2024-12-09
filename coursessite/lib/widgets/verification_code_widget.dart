import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:developer' as developer;
// Add your AWS config import here

class VerificationCodeWidget extends StatefulWidget {
  final String username;
  final Function(String) onVerificationComplete;
  final VoidCallback? onResendCode;

  const VerificationCodeWidget({
    Key? key,
    required this.onVerificationComplete,
    this.username = 'for.trials.acc@gmail.com', // Set a default value for username
    this.onResendCode,
  }) : super(key: key);

  @override
  State<VerificationCodeWidget> createState() => _VerificationCodeWidgetState();
}

class _VerificationCodeWidgetState extends State<VerificationCodeWidget> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _verifyCode() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      developer.log('Verifying code for user: ${widget.username}');
      
      final userPool = CognitoUserPool(
        dotenv.env['AWS_USER_POOL_ID']!, // Replace with your pool ID from .env
        dotenv.env['AWS_CLIENT_ID']!,    // Replace with your client ID from .env
      );

      final cognitoUser = CognitoUser(widget.username, userPool);

      final result = await cognitoUser.confirmRegistration(_controller.text);
      developer.log('Verification result: $result');
      
      if (!mounted) return;
      
      if (result) {
        // widget.onVerificationComplete(_controller.text);
          ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Successfully registered'),
            duration: Duration(seconds: 3),
            backgroundColor: Colors.teal,
          ),
        );
        Navigator.of(context).pushReplacementNamed('/landpage');
      } else {
        setState(() {
          _errorMessage = 'Verification failed. Please try again.';
        });
      }
      
    } on CognitoClientException catch (e) {
      developer.log('Cognito error: ${e.code} - ${e.message}');
      setState(() {
        if (e.code == 'CodeMismatchException') {
          _errorMessage = 'Invalid verification code. Please try again.';
        } else if (e.code == 'ExpiredCodeException') {
          _errorMessage = 'Code has expired. Please request a new one.';
        } else if (e.code == 'NotAuthorizedException') {
          _errorMessage = 'Unable to verify code. Please try again.';
        } else if (e.code == 'UserNotFoundException') {
          _errorMessage = 'User not found. Please sign up again.';
        } else {
          _errorMessage = 'Error: ${e.message}';
        }
      });
      
      if (e.code == 'ExpiredCodeException') {
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            Navigator.of(context).pushReplacementNamed('/signup');
          }
        });
      }
    } catch (e) {
      developer.log('Unexpected error: $e');
      setState(() {
        _errorMessage = 'An unexpected error occurred. Please try again.';
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
      child: Container(
        color: theme.colorScheme.background,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Enter Verification Code',
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
                controller: _controller,
                keyboardType: TextInputType.number,
                maxLength: 6,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  hintText: '000000',
                  counterText: '',
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: theme.colorScheme.surfaceVariant,
                ),
                validator: (value) {
                  if (value == null || value.length != 6) {
                    return 'Please enter a 6-digit code';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: _isLoading ? null : _verifyCode,
                child: _isLoading 
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text('Verify', style: theme.textTheme.labelLarge),
              ),
              if (widget.onResendCode != null)
                TextButton(
                  onPressed: widget.onResendCode,
                  child: Text('Resend Code', style: theme.textTheme.labelLarge),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}