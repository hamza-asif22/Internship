class MyOrderModel {
  String title;
  String itemname;
  double itemprice;
  String itemquantity;
  String itemid;
  String picture;
  String status;
  String itemdate;

  MyOrderModel({
    required this.itemid,
    required this.itemname,
    required this.itemprice,
    required this.itemquantity,
    required this.picture,
    required this.title,
    required this.itemdate,
    required this.status,
  });
}
