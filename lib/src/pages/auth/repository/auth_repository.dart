import 'package:quitanda_virtual/src/constants/endpoints.dart';
import 'package:quitanda_virtual/src/services/http_manager.dart';

class AuthRepository {
  final HttpMManager _httpManger = HttpMManager();
  Future signIn({required String email, required String password}) async {
    final result = await _httpManger.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        "email": "emilsongyn17@gmail.com",
        "password": "178659",
      },
    );

    if (result['result'] != null) {
      print('Signin funcionou!');
    } else {
      print('Sigin não funcionou!');
    }
  }
}
