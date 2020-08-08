import 'package:ecom_app/models/product.dart';
import 'package:ecom_app/screens/product_detail.dart';
import 'package:flutter/material.dart';

class HomeHotProduct extends StatefulWidget {
  final Product product;
  HomeHotProduct(this.product);
  @override
  _HomeHotProductState createState() => _HomeHotProductState();
}

class _HomeHotProductState extends State<HomeHotProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190.0,
      height: 260.0,
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(this.widget.product)));
        },
              child: Card(
          child: Column(
            children: <Widget>[
              Text(this.widget.product.name),
              Image.network(widget.product.photo, width: 190.0, height: 160.0,),
              Row(children: <Widget>[
                Text('Price: ${this.widget.product.price}'),
                Text('Discount: ${this.widget.product.discount}'),
              ],)
              
            ],
          ),
        ),
      ),
    );
  }
}