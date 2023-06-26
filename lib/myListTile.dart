import 'package:apicalldemo/bloc/CartBloc.dart';
import 'package:apicalldemo/bloc/CartCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Product.dart';

class MyListTile extends StatelessWidget {
  final Product item;

  const MyListTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xff764abc),
        child: Text(item.name.toString()),
      ),
      title: Text(item.name),
      subtitle: const Text('Item description'),
      trailing: GestureDetector(
          onTap: () {
            context.read<CartCubit>().addToCart(item);
            // setState(() {
            //   items[index].isAdded = !items[index].isAdded;
            //   items[index].isAdded? cartCount++ : cartCount--;
            // });
          },
          child: Icon(Icons.shopping_cart,
              color: item.isAdded ? Colors.black : Colors.blue)),
    );
  }
}
