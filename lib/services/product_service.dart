import 'package:ecom_app/repository/repository.dart';

class ProductService {
  Repository _repository;
  ProductService() {
    _repository = Repository();
  }

  getHotProducts() async {
    return await _repository.httpGet('get-all-hot-products');
  }

  getNewArrivalProducts() async {
    return await _repository.httpGet('get-all-new-arrival-products');
  }

  getProductsByCategoryId(int categoryId) async {
    return await _repository.httpGetById(
        "get-products-by-category", categoryId);
  }

  getAllProducts() async {
    return await _repository.httpGet("products");
  }
}
