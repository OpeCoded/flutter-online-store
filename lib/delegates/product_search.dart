import 'package:ecom_app/models/product.dart';
import 'package:ecom_app/screens/product_detail.dart';
import 'package:flutter/material.dart';

class ProductSearch extends SearchDelegate<String> {
  final List<Product> products;
  ProductSearch({this.products});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // todo: implement buildResults
    throw UnimplementedError();
  }

  /*
   * query: is the getter of the search delegate, for getting what the user types in the search field
   */
  @override
  Widget buildSuggestions(BuildContext context) {
    final productSearchList = query.isEmpty
        ? products
        : products.where((product) {
            return product.name.toLowerCase().startsWith(query.toLowerCase());
          }).toList();
    return ListView.builder(
        itemCount: productSearchList.length,
        itemBuilder: (context, index) {
          return ListTile(
            //takes user to the product detail, when the search suggestion is tapped
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailScreen(productSearchList[index])));
            },
            leading: Image.network(productSearchList[index].photo),
            title: Text(productSearchList[index].name),
          );
        });
  }
}
