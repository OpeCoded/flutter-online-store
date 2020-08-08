import 'dart:convert';

import 'package:ecom_app/models/order.dart';
import 'package:ecom_app/models/product.dart';

class Payment {
  int id;
  String name;
  String email;
  String cardNumber;
  String expiryMonth;
  String expiryYear;
  String cvcNumber;
  int userId;
  Order order;
  List<Product> cartItems;

  toJson() {
    return {
      'id': id.toString(),
      'userId': userId.toString(),
      'name': name.toString(),
      'email': email.toString(),
      'cardNumber': cardNumber.toString(),
      'expiryMonth': expiryMonth.toString(),
      'expiryYear': expiryYear.toString(),
      'cvcNumber': cvcNumber.toString(),
      'order':
          json.encoder.convert({'paymentType': order.paymentType.toString()}),
      'cartItems': json.encoder.convert(cartItems)
    };
  }
}
