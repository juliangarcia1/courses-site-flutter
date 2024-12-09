import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class AwsConfig {
  static String get userPoolId {
    final poolId = dotenv.env['AWS_USER_POOL_ID'] ?? '';
    if (poolId.isEmpty) {
      throw ArgumentError('AWS_USER_POOL_ID is not configured');
    }

    final parts = poolId.split('_');
    if (parts.length != 2) {
      throw ArgumentError('AWS_USER_POOL_ID must be in format "region_poolid"');
    }

    final region = parts[0];
    if (!RegExp(r'^[a-z]{2}-[a-z]+-\d{1}$').hasMatch(region)) {
      throw ArgumentError('Invalid region format in AWS_USER_POOL_ID. Expected format: "us-east-1"');
    }

    final id = parts[1];
    if (!RegExp(r'^[A-Za-z0-9]+$').hasMatch(id)) {
      throw ArgumentError('Invalid pool ID format in AWS_USER_POOL_ID');
    }

    return poolId;
  }
  static String get clientId => dotenv.env['AWS_CLIENT_ID'] ?? '';
  static String get region => dotenv.env['AWS_REGION'] ?? '';
  static String get identityPoolId => dotenv.env['AWS_IDENTITY_POOL_ID'] ?? '';
  static String get clientSecret => dotenv.env['AWS_CLIENT_SECRET'] ?? '';

  static bool get hasClientSecret => clientSecret.isNotEmpty;

  static String calculateSecretHash(String username) {
    if (!hasClientSecret) {
      throw StateError('Client secret is required but not configured');
    }
    if (username.isEmpty) {
      throw ArgumentError('Username cannot be empty for SECRET_HASH calculation');
    }

    final key = utf8.encode(clientSecret);
    // AWS expects the message to be username + clientId in this specific order
    final message = utf8.encode('$username$clientId');
    final hmacSha256 = Hmac(sha256, key);
    final digest = hmacSha256.convert(message);
    final base64String = base64.encode(digest.bytes);
    
    print('Debug - Secret Hash Generated: $base64String'); // Remove in production
    return base64String;
  }
}