import 'package:get/get.dart';
import 'package:timbu_mobile_app/models/product.model.dart';
import 'package:timbu_mobile_app/repositories/product_repository.dart';
import 'package:timbu_mobile_app/util/helpers/my_loader.dart';
import 'package:timbu_mobile_app/util/helpers/network_manager.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final _productRepository = Get.put(ProductRepository());
  final _networkManager = Get.put(NetworkManager());

  RxList<ProductModel> allProducts = <ProductModel>[].obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  Future<void> getProducts() async {
    final isConnected = await _networkManager.isConnected();
    print('Network status: $isConnected'); // Debugging line

    if (!isConnected) {
      MyLoader.errorSnackBar(
        title: "Oh Snap!",
        message: 'You currently are not connected to the internet',
      );
      return;
    }

    try {
      isLoading.value = true;
      final products = await _productRepository.fetchProducts();
      if (products.isNotEmpty) {
        allProducts.assignAll(products);
        print('Products fetched successfully: ${products.length} items'); // Debugging line
      } else {
        print('No products found'); // Debugging line
      }
    } catch (e) {
      print('Error fetching products: $e'); // Debugging line
      MyLoader.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
