import 'package:ecom_app/models/payment.dart';
import 'package:ecom_app/repository/repository.dart';

class PaymentService {
  Repository _repository;

  PaymentService(){
    _repository = Repository();
  }

  makePayment(Payment payment) async {
    return await _repository.httpPost('make-payment', payment.toJson());
  }
}