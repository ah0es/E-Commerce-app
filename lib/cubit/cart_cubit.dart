import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  int item = 0;
  double total = 0;
  String click ='';
  void cartItems() {
    if (item >= 0) {
      emit(Success());
    }
  }
}
