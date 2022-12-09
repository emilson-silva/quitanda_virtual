import 'package:quitanda_virtual/src/constants/endpoints.dart';
import 'package:quitanda_virtual/src/models/user_model.dart';
import 'package:quitanda_virtual/src/pages/auth/repository/auth_errors.dart'
    as authErrorsSTring;
import 'package:quitanda_virtual/src/pages/auth/result/auth_result.dart';
import 'package:quitanda_virtual/src/services/http_manager.dart';

class AuthRepository {
  final HttpMManager _httpManger = HttpMManager();

  AuthResult handleUserOrError(Map<dynamic, dynamic> result) {
    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);

      return AuthResult.success(user);
    } else {
      return AuthResult.error(
          authErrorsSTring.authErrorsSTring(result['error']));
    }
  }

  Future<AuthResult> validateToken(String token) async {
    final result = await _httpManger.restRequest(
      url: Endpoints.validateToken,
      method: HttpMethods.post,
      headers: {
        'X-Parse-Session-Token': token,
      },
    );

    return handleUserOrError(result);
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

    return handleUserOrError(result);
  }

  Future<AuthResult> signUp(UserModel user) async {
    final result = await _httpManger.restRequest(
      url: Endpoints.signup,
      method: HttpMethods.post,
      // TODO enviar dados
      body: user.toJson(),
    );

    return handleUserOrError(result);
  }
}
