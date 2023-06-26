part of 'CartBloc.dart';


//What we get as input from App
abstract class CartEvent extends Equatable{
  const CartEvent();

  @override
  List<Object?> get props => [];

}
class CartInitialEvent extends CartEvent{

}
class AddtoCart extends CartEvent{
   final Product product;
   const AddtoCart(this.product);
   @override
   List<Object?> get props => [product];
}