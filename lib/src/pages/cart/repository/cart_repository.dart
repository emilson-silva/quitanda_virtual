import 'package:quitanda_virtual/src/constants/endpoints.dart';
import 'package:quitanda_virtual/src/services/http_manager.dart';

class CartRepository {
  final _httpManager = HttpMManager();

  Future getCartItems({
    required String token,
    required String userId,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getCartItems,
      method: HttpMethods.post,
      headers: {
        'X-Parse-Session-Token': token,
      },
      body: {
        'user': userId,
      },
    );

    if (result['result'] != null) {
      // Tratar
      print(result['result']);
    } else {
      // Retornar uma mensagem
      print('Ocorreu um erro ao recuperar os itens do carrinho.');
    }
  }
}
