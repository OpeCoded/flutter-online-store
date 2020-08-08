import 'package:ecom_app/repository/repository.dart';

class CategoryService {
  Repository _repository;
  CategoryService(){
    _repository = Repository();
  }

  getCategories() async {
    return await _repository.httpGet('categories');
  }
}