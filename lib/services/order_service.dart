import 'package:ecom_app/repository/repository.dart';

class OrderService {
  Repository _repository;

  OrderService(){
    _repository = Repository();
  }

  getOrdersByUserId(int userId) async{
    return await _repository.httpGetById('get-order-list-by-user-id', userId);
  }
}