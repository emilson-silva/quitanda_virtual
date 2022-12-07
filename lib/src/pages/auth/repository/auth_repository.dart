import 'package:quitanda_virtual/src/constants/endpoints.dart';
import 'package:quitanda_virtual/src/models/user_model.dart';
import 'package:quitanda_virtual/src/services/http_manager.dart';

class AuthRepository {
  final HttpMManager _httpManger = HttpMManager();
  Future signIn({required String email, required String password}) async {
    final result = await _httpManger.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": password,
      },
    );

    if (result['result'] != null) {
      print('Signin funcionou!');

      final user = UserModel.fromMap(result['result']);
      print(user);
    } else {
      print('Sigin não funcionou!');
      print(result['error']);
    }
  }
}
