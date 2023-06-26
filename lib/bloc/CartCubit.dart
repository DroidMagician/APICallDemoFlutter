
import 'package:apicalldemo/bloc/CartBloc.dart';
import 'package:bloc/bloc.dart';

import '../Product.dart';

class CartCubit extends Cubit<CartState>
{
  CartCubit():super(const CartState());

   initialLoad(){
    var items = List<Product>.generate(100, (i) => Product("Item $i", false));
    emit(state.copyWith(items: items));
  }

  addToCart(Product product)
  {
    var list = state.items;
    var myProduct = list.indexWhere((element) => element.name == product.name);
    list[myProduct].isAdded = !list[myProduct].isAdded;
    var count = list.where((element) => element.isAdded).length;
    emit(state.copyWith(items: List.from(list),count: count));
  }

}