
import 'package:flutter/material.dart';
import '../widgets/verification_code_widget.dart';
import '../services/cognito_service.dart';

class VerificationScreen extends StatelessWidget {
  final String username;
  final CognitoService cognitoService;

  const VerificationScreen({
    Key? key,
    required this.username,
    required this.cognitoService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verificar Cuenta')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: VerificationCodeWidget(
          username: username,
          onVerificationComplete: (code) async {
            try {
              await cognitoService.confirmSignUp(username, code);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Cuenta verificada exitosamente')),
                );
                Navigator.of(context).pushReplacementNamed('/login');
              }
            } catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(e.toString())),
                );
              }
            }
          },
          onResendCode: () async {
            try {
              await cognitoService.resendConfirmationCode(username);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Código reenviado')),
                );
              }
            } catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(e.toString())),
                );
              }
            }
          },
        ),
      ),
    );
  }
}