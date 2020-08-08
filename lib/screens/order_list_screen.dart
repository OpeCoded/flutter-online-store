import 'dart:convert';

import 'package:ecom_app/models/order.dart';
import 'package:ecom_app/services/order_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderListScreen extends StatefulWidget {
  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  List<Order> _orderList = List<Order>();
  @override
  void initState() {
    super.initState();
    _getOrderListByUserId();
  }

  _getOrderListByUserId() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    int _userId = _prefs.getInt('userId');
    OrderService _orderService = OrderService();
    var result = await _orderService.getOrdersByUserId(_userId);
    var orders = json.decode(result.body);
    orders.forEach((order) {
      var model = Order();
      model.id = order['id'];
      model.paymentType = order['payment_type'];
      model.totalAmount = order['total_amount'];
      model.createdAt = order['created_at'];
      model.status = order['status'];
      //model.quantity = order['quantity'];
      //model.totalAmount = double.tryParse(order['total_amount'].toString());
      //model.product.name = order['product']['name'];
      //model.product.photo = order['product']['photo'];

      setState(() {
        _orderList.add(model);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order List Screen')),
      body: ListView.builder(
        itemCount: _orderList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Order ID : ${_orderList[index].id.toString()}"),
                  Text("Total : \$${_orderList[index].totalAmount.toString()}"),                  
                  Text("Date : ${_orderList[index].createdAt}"),
                  Text("Status : ${_orderList[index].status}"),
                  Text("Payment type : ${_orderList[index].paymentType}")
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
