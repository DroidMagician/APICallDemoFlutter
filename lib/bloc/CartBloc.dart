import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../Product.dart';

part 'CartEvent.dart';

part 'CartState.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {

    //Perform logic when any user add item in cart
    on<AddtoCart>(_onAddToCart);

    //Load initial Data in list
    on<CartInitialEvent>(_onCartInitial);

  }

  _onAddToCart(
    AddtoCart event,
    Emitter<CartState> emit,
  ) {
    var product = event.product;
    product.isAdded = !product.isAdded;
    var items = state.items;
    var index = items.indexWhere((element) => element.name == product.name);
    items[index]=product;
    var totalCount = items.where((element) => element.isAdded).length;
    emit(state.copyWith(items: List.from(items),count: totalCount));

  }

  _onCartInitial(CartInitialEvent event, Emitter<CartState> emit) {
    final items = List<Product>.generate(100, (i) => Product("Item $i", false));
    emit(state.copyWith(items: items));
  }
}
