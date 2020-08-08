import 'package:ecom_app/models/product.dart';
import 'package:ecom_app/screens/product_detail.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  final Product product;
  ProductWidget(this.product);
  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 190,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(this.widget.product)));
        },
        child: Card(
          child: Column(
            children: <Widget>[
              Text(this.widget.product.name),
              Image.network(
                widget.product.photo,
                width: 190.0,
                height: 160.0,
              ),
              Row(
                children: <Widget>[
                  Text('Price: ${this.widget.product.price}'),
                  Text('Discount: ${this.widget.product.discount}'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
