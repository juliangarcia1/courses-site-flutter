import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:coursessite/services/cognito_service.dart';

class VerifyEmailScreen extends StatefulWidget {
  final String email;
  final CognitoService cognitoService;

  const VerifyEmailScreen({
    Key? key,
    required this.email,
    required this.cognitoService,
  }) : super(key: key);

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController _verificationController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificar Email'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Se ha enviado un código de verificación a:\n${widget.email}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _verificationController,
                decoration: const InputDecoration(
                  labelText: 'Código de verificación',
                  hintText: '123456',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                ],
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : () async {
                    setState(() => _isLoading = true);
                    try {
                      await widget.cognitoService.confirmSignUp(
                        widget.email,
                        _verificationController.text,
                      );
                      if (mounted) {
                        Navigator.of(context).pushReplacementNamed('/login');
                      }
                    } catch (e) {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.toString())),
                        );
                      }
                    }
                    if (mounted) {
                      setState(() => _isLoading = false);
                    }
                  },
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Verificar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _verificationController.dispose();
    super.dispose();
  }
}