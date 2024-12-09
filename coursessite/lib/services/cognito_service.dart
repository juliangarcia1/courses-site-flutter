import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import '../core/config/aws_config.dart';

class CognitoService {
  late final CognitoUserPool _userPool;

  CognitoService() {
    _userPool = CognitoUserPool(
      AwsConfig.userPoolId,
      AwsConfig.clientId,
    );
  }

  Future<void> signUp(
      {required String username, required String password}) async {
    try {
      final signUpResult = await _userPool.signUp(
        username,
        password,
        userAttributes: [
          AttributeArg(name: 'email', value: username),
        ],
      );
      
      if (signUpResult == null) {
        throw Exception('Error during sign up');
      }
    } catch (e) {
      throw Exception('Sign up failed: ${e.toString()}');
    }
  }

  Future<void> confirmSignUp(String username, String confirmationCode) async {
    try {
      final cognitoUser = CognitoUser(username, _userPool);
      if (AwsConfig.hasClientSecret) {
        cognitoUser.setAuthenticationFlowType('USER_PASSWORD_AUTH');
      }
      
      final confirmResult = await cognitoUser.confirmRegistration(confirmationCode);
      print('XXXXXXXDebug - Confirm result: $confirmResult');
      if (!confirmResult) {
        throw Exception('Failed to confirm registration');
      }
    } catch (e) {
      throw Exception('Verification failed: ${e.toString()}');
    }
  }

  Future<void> resendConfirmationCode(String username) async {
    try {
      final cognitoUser = CognitoUser(username, _userPool);
      if (AwsConfig.hasClientSecret) {
        cognitoUser.setAuthenticationFlowType('USER_PASSWORD_AUTH');
      }
      
      await cognitoUser.resendConfirmationCode();
    } catch (e) {
      throw Exception('Failed to resend code: ${e.toString()}');
    }
  }
}