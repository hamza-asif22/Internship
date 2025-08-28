import 'package:task1/model/myorderscreen.dart';

class MyOrderController {
  List<MyOrderModel> orderdata = [
    MyOrderModel(
      itemid: '#162432',
      itemname: 'Pizza Hut',
      itemprice: 35.25,
      itemquantity: '03 Items',
      picture: 'assets/search/pizza1.jpg',
      title: 'Food',
      itemdate: '29 JAN, 12:30',
      status: 'Completed',
    ),
    MyOrderModel(
      itemid: '#242432',
      itemname: 'McDonald',
      itemprice: 40.15,
      itemquantity: '02 Items',
      picture: 'assets/search/shake1.jpg',
      title: 'Drink',
      itemdate: '30 JAN, 12:30',
      status: 'Completed',
    ),
    MyOrderModel(
      itemid: '#240112',
      itemname: 'Starbucks',
      itemprice: 10.20,
      itemquantity: '01 Items',
      picture: 'assets/search/coffee1.jpg',
      title: 'Drink',
      itemdate: '30 JAN, 12:30',
      status: 'Canceled',
    ),
  ];
}
