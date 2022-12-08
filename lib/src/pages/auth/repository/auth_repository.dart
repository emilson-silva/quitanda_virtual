import 'package:quitanda_virtual/src/constants/endpoints.dart';
import 'package:quitanda_virtual/src/models/user_model.dart';
import 'package:quitanda_virtual/src/pages/auth/repository/auth_errors.dart'
    as authErrorsSTring;
import 'package:quitanda_virtual/src/pages/auth/result/auth_result.dart';
import 'package:quitanda_virtual/src/services/http_manager.dart';

class AuthRepository {
  final HttpMManager _httpManger = HttpMManager();

  Future<AuthResult> validateToken(String token) async {
    final result = await _httpManger.restRequest(
      url: Endpoints.validateToken,
      method: HttpMethods.post,
      headers: {
        'X-Parse-Session-Token': token,
      },
    );

    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);

      return AuthResult.success(user);
    } else {
      return AuthResult.error(
          authErrorsSTring.authErrorsSTring(result['error']));
    }
  }

  Future<AuthResult> signIn(
      {required String email, required String password}) async {
    final result = await _httpManger.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);

      return AuthResult.success(user);
    } else {
      return AuthResult.error(
          authErrorsSTring.authErrorsSTring(result['error']));
    }
  }
}
