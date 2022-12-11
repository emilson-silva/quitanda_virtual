import 'package:quitanda_virtual/src/constants/endpoints.dart';
import 'package:quitanda_virtual/src/models/cart_item_model.dart';
import 'package:quitanda_virtual/src/pages/cart/cart_result/cart_result.dart';
import 'package:quitanda_virtual/src/services/http_manager.dart';

class CartRepository {
  final _httpManager = HttpMManager();

  Future<CartResult<List<CartItemModel>>> getCartItems({
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
      List<CartItemModel> data =
          List<Map<String, dynamic>>.from(result['result'])
              .map(CartItemModel.fromJson)
              .toList();

      return CartResult<List<CartItemModel>>.success(data);
    } else {
      // Retornar uma mensagem
      return CartResult.error(
          'Ocorreu um erro ao recuperar os intens do carrinho');
    }
  }

  Future<CartResult<String>> addItemToCart({
    required String userId,
    required String token,
    required String productId,
    required int quantity,
  }) async {
    final result = await _httpManager.restRequest(
        url: Endpoints.addItemToCart,
        method: HttpMethods.post,
        body: {
          'user': userId,
          'quantity': quantity,
          'productId': productId,
        },
        headers: {
          'X-Parse-Session-Token': token,
        });

    if (result['result'] != null) {
      // Adicionamos o produto caso de sucesso
      return CartResult<String>.success(result['result']['id']);
    } else {
      // Caso de erro ao adicionar
      return CartResult.error('Não foi possível adicionar o item no carrinho');
    }
  }
}
