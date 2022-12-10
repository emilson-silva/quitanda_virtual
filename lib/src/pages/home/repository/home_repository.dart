import 'package:quitanda_virtual/src/constants/endpoints.dart';
import 'package:quitanda_virtual/src/models/category_model.dart';
import 'package:quitanda_virtual/src/pages/home/result/home_result.dart';
import 'package:quitanda_virtual/src/services/http_manager.dart';

class HomeRepository {
  final HttpMManager _httpMManager = HttpMManager();

  Future<HomeResult<CategoryModel>> getAllCategories() async {
    final result = await _httpMManager.restRequest(
      url: Endpoints.getAllCategories,
      method: HttpMethods.post,
    );

    if (result['result'] != null) {
      List<CategoryModel> data =
          (List<Map<String, dynamic>>.from(result['result']))
              .map(CategoryModel.fromJson)
              .toList();

      return HomeResult<CategoryModel>.success(data);
    } else {
      // Erro
      return HomeResult.error(
        'Ocorreu um erro inesperado ao recuperar asa categorias',
      );
    }
  }
}
