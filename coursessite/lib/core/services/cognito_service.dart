import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import '../config/aws_config.dart';

class CognitoService {
  late final CognitoUserPool userPool;

  CognitoService() {
    final poolId = AwsConfig.userPoolId;
    final clientId = AwsConfig.clientId;
    
    print('Debug - Pool ID: $poolId'); // Add debug logging
    print('Debug - Client ID: $clientId'); // Add debug logging
    
    if (!_isValidPoolId(poolId)) {
      throw ArgumentError('Invalid userPoolId format. Received: $poolId'); // Add value to error
    }
    
    userPool = CognitoUserPool(poolId, clientId);
  }

  bool _isValidPoolId(String poolId) {
    final parts = poolId.split('_');
    return parts.length == 2 && parts[0].isNotEmpty && parts[1].isNotEmpty;
  }

  Future<bool> signUp(String email, String password) async {
    try {
      if (AwsConfig.userPoolId.isEmpty || AwsConfig.clientId.isEmpty) {
        throw Exception('AWS configuration missing. Please check your .env file.');
      }

      final userAttributes = [
        AttributeArg(name: 'email', value: email),
      ];

      await userPool.signUp(
        email,
        password,
        userAttributes: userAttributes,
      );
      return true;
    } on CognitoClientException catch (e) {
      switch (e.code) {
        case 'NetworkError':
          throw Exception('Network error. Please check your internet connection.');
        case 'InvalidParameterException':
          throw Exception('Invalid email or password format.');
        case 'UsernameExistsException':
          throw Exception('This email is already registered.');
        default:
          throw Exception(e.message ?? 'An unknown error occurred');
      }
    } catch (e) {
      throw Exception('Failed to sign up: ${e.toString()}');
    }
  }

  Future<bool> signIn(String email, String password) async {
    final cognitoUser = CognitoUser(email, userPool);
    final authDetails = AuthenticationDetails(
      username: email,
      password: password,
    );

    try {
      final session = await cognitoUser.authenticateUser(authDetails);
      return session != null;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> forgotPassword(String email) async {
    try {
      final user = CognitoUser(email, userPool);
      await user.forgotPassword();
      return true;
    } catch (e) {
      if (e is CognitoClientException) {
        throw Exception(e.message);
      }
      throw Exception('An error occurred during password reset');
    }
  }

  Future<bool> confirmForgotPassword(String email, String code, String newPassword) async {
    try {
      final user = CognitoUser(email, userPool);
      await user.confirmPassword(code, newPassword);
      return true;
    } catch (e) {
      if (e is CognitoClientException) {
        throw Exception(e.message);
      }
      throw Exception('An error occurred during password reset confirmation');
    }
  }

  Future<void> signOut() async {
    try {
      final currentUser = await userPool.getCurrentUser();
      if (currentUser != null) {
        await currentUser.signOut();
      }
    } catch (e) {
      throw Exception('Failed to sign out: ${e.toString()}');
    }
  }
}