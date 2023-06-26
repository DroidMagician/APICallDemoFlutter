
import 'package:apicalldemo/Product.dart';
import 'package:apicalldemo/myListTile.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  List<Product> items;
  Function(int index) onItemClicked;
  ProductList({required this.items,required this.onItemClicked});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return MyListTile(item: items[index]);
      },
    );
  }
}
