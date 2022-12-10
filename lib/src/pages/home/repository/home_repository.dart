import 'package:quitanda_virtual/src/constants/endpoints.dart';
import 'package:quitanda_virtual/src/services/http_manager.dart';

class HomeRepository {
  final HttpMManager _httpMManager = HttpMManager();

  getAllCategories() async {
    final result = await _httpMManager.restRequest(
      url: Endpoints.getAllCategories,
      method: HttpMethods.post,
    );

    if (result['result'] != null) {
      // Lista
    } else {
      // Erro
    }
  }
}
