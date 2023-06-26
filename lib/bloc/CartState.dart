part of 'CartBloc.dart';

//The value which can be change and update as an output to UI
class CartState extends Equatable {
  final List<Product> items;
  final int count;

  const CartState({
    this.items = const [],
    this.count = 0,
  });

  @override
  List<Object?> get props => [items, count];

  CartState copyWith({List<Product>? items, int? count}) {
    return CartState(items: items ?? this.items, count: count ?? this.count);
  }
}
