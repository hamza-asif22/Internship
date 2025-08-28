import 'package:task1/model/cart_model.dart';
import '../constants/text/cartscreen.dart';
import '../constants/images/cartscreen.dart';

class CartController {
  bool isEdit = false;
  bool addressedit = false;

  List<CartModel> cartData = [
    CartModel(
      name: CartText.listname1,
      price: CartText.listprice1,
      size: CartText.listsize1,
      quantity: CartText.listquantity1,
      image: CartImage.pizza1,
    ),
    CartModel(
      name: CartText.listname2,
      price: CartText.listprice2,
      size: CartText.listsize2,
      quantity: CartText.listquantity2,
      image: CartImage.pizza2,
    ),
     
    
  ];

  double get totalSum =>
      cartData.fold(0, (sum, item) => sum + (item.price * item.quantity));

  void toggleEditMode() {
    isEdit = !isEdit;
  }
  void toggleaddressEditMode() {
    addressedit = !addressedit;
  }

  void increasecount(int index) {
    cartData[index].quantity++;
  }

  void decreasecount(int index) {
    if (cartData[index].quantity > 1) {
      cartData[index].quantity--;
    }
  }

  void removeitem(int index) {
    if (index >= 0 && index < cartData.length) {
      cartData.removeAt(index);
    }
  }
}
