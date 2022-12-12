import 'package:get/get.dart';
import 'package:quitanda_virtual/src/models/order_model.dart';
import 'package:quitanda_virtual/src/pages/auth/controller/auth_controller.dart';
import 'package:quitanda_virtual/src/pages/orders/orders_result/orders_result.dart';
import 'package:quitanda_virtual/src/pages/orders/repository/orders_repository.dart';
import 'package:quitanda_virtual/src/services/utils_services.dart';

class AllOrdersController extends GetxController {
  List<OrderModel> allOrders = [];
  final ordersRepository = OrdersRepository();
  final authContoller = Get.find<AuthController>();
  final utilsServices = UtilsServices();

  @override
  void onInit() {
    super.onInit();
    getAllOrders();
  }

  Future<void> getAllOrders() async {
    OrdersResult<List<OrderModel>> result = await ordersRepository.getAllOrders(
      userId: authContoller.user.id!,
      token: authContoller.user.token!,
    );

    result.when(
      success: (orders) {
        allOrders = orders;
        update();
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }
}
