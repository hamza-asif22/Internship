import 'package:flutter/material.dart';
import 'package:task1/constants/text/cartscreen.dart';
import 'package:task1/controller/cart_controller.dart';
import 'package:task1/model/cart_model.dart';
import '../constants/color/cartscreen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartControl = CartController();
  final TextEditingController addressController = TextEditingController(
    text: CartText.location,
  );

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: CartColor.bg1,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.07),

                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: screenWidth * 0.1,
                        height: screenWidth * 0.1,
                        decoration: BoxDecoration(
                          color: CartColor.black87,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            size: screenWidth * 0.04,
                            color: CartColor.white,
                          ),
                          onPressed:
                              () => Navigator.of(
                                context,
                              ).pushReplacementNamed('/home'),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Text(
                      CartText.topcart,
                      style: TextStyle(
                        fontSize: screenWidth * 0.044,
                        fontWeight: FontWeight.w400,
                        color: CartColor.white,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          cartControl.toggleEditMode();
                        });
                      },
                      child: Text(
                        cartControl.isEdit ? CartText.done : CartText.edititem,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color:
                              cartControl.isEdit
                                  ? CartColor.isedit
                                  : CartColor.orange,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              cartControl.isEdit
                                  ? CartColor.isedit
                                  : CartColor.orange,
                          decorationThickness: screenWidth * 0.004,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: screenHeight * 0.45,
                  child: ListView.builder(
                    itemCount: cartControl.cartData.length,
                    itemBuilder: (context, index) {
                      return _buildCartItem(cartControl.cartData[index], index);
                    },
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.07),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: CartColor.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.06,
                vertical: screenHeight * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        CartText.address,
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w400,
                          color: CartColor.grey400,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            cartControl.toggleaddressEditMode();
                          });
                        },
                        child: Text(
                          cartControl.addressedit
                              ? CartText.done
                              : CartText.edit,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color:
                                cartControl.addressedit
                                    ? CartColor.isedit
                                    : CartColor.orange,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                cartControl.addressedit
                                    ? CartColor.isedit
                                    : CartColor.orange,
                            decorationThickness: screenWidth * 0.004,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextField(
                    controller: addressController,
                    enabled: cartControl.addressedit,
                    style: TextStyle(
                      color: CartColor.grey500,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: CartColor.grey100,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  Row(
                    children: [
                      Text(
                        CartText.total,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: CartColor.grey400,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        "\$${cartControl.totalSum.toStringAsFixed(0)}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.06,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              CartText.breakdown,
                              style: TextStyle(
                                fontSize: screenWidth * 0.035,
                                color: CartColor.orange,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.015),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: screenWidth * 0.035,
                              color: CartColor.grey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  SizedBox(
                    width: double.infinity,
                    height: screenHeight * 0.07,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushReplacementNamed('/payementscreen');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CartColor.deeporange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        CartText.button,
                        style: TextStyle(
                          color: CartColor.white,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.2,
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(CartModel item, int index) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.02),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              item.image,
              fit: BoxFit.cover,
              height: screenHeight * 0.14,
              width: screenWidth * 0.38,
            ),
          ),
          SizedBox(width: screenWidth * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                        color: CartColor.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: screenHeight * 0.07,
                      width: screenWidth * 0.07,
                      child:
                          cartControl.isEdit
                              ? Container(
                                decoration: BoxDecoration(
                                  color: CartColor.red,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(
                                    Icons.close,
                                    color: CartColor.white,
                                    size: screenWidth * 0.045,
                                  ),
                                  onPressed:
                                      () => setState(() {
                                        cartControl.removeitem(index);
                                      }),
                                ),
                              )
                              : null,
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "\$${item.price.toStringAsFixed(0)}",
                  style: TextStyle(
                    color: CartColor.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.0015),
                Row(
                  children: [
                    Text(
                      "${item.size}''",
                      style: TextStyle(color: CartColor.grey),
                    ),
                    SizedBox(width: screenWidth * 0.13),
                    Container(
                      height: screenHeight * 0.07,
                      width: screenWidth * 0.07,
                      decoration: BoxDecoration(
                        color: CartColor.black87,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.remove,
                          color: CartColor.white,
                          size: screenWidth * 0.05,
                        ),
                        onPressed:
                            () => setState(() {
                              cartControl.decreasecount(index);
                            }),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                      ),
                      child: Text(
                        "${item.quantity}",
                        style: TextStyle(color: CartColor.white),
                      ),
                    ),
                    Container(
                      height: screenHeight * 0.07,
                      width: screenWidth * 0.07,
                      decoration: BoxDecoration(
                        color: CartColor.black87,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.add,
                          color: CartColor.white,
                          size: screenWidth * 0.05,
                        ),
                        onPressed:
                            () => setState(() {
                              cartControl.increasecount(index);
                            }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
