import 'package:flutter/material.dart';
import 'package:task1/controller/myorderscreen.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  final myOrder = MyOrderController();
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 22),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 12,
              vertical: 12,
            ),

            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, size: 16),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/home');
                    },
                  ),
                ),
                const SizedBox(width: 18),
                const Text(
                  "My Orders",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.more_horiz, size: 26),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected = true;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Ongoing',
                          style: TextStyle(
                            fontSize: 16,
                            color: isSelected ? Colors.deepOrange : Colors.grey,
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: 150,
                          height: 2,
                          color:
                              isSelected ? Colors.orange : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected = false;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'History',
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                !isSelected ? Colors.deepOrange : Colors.grey,
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: 150,
                          height: 2,
                          color:
                              !isSelected ? Colors.orange : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child:
                  isSelected
                      ? ListView.builder(
                        itemCount: myOrder.orderdata.length,
                        itemBuilder: (context, index) {
                          final item = myOrder.orderdata[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.title),
                                const Divider(),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 84,
                                          height: 84,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            child: Image.asset(
                                              item.picture,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(item.itemname),
                                                SizedBox(width: 150),
                                                Text(item.itemid),
                                              ],
                                            ),
                                            SizedBox(height: 12),
                                            Row(
                                              children: [
                                                Text('\$${item.itemprice}'),
                                                SizedBox(width: 6),
                                                Text('|  ${item.itemquantity}'),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 6),
                                    Container(
                                      width: double.infinity,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.deepOrange,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: Text(
                                                "Track Order",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 44),
                                          Expanded(
                                            flex: 1,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                side: BorderSide(
                                                  color: Colors.deepOrange,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                  color: Colors.deepOrange,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      )
                      : ListView.builder(
                        itemCount: myOrder.orderdata.length,
                        itemBuilder: (context, index) {
                          final item = myOrder.orderdata[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(item.title),
                                    SizedBox(width: 32),
                                    Text(
                                      item.status,
                                      style: TextStyle(
                                        color:
                                            item.status.toLowerCase() ==
                                                    "completed"
                                                ? Colors.green
                                                : item.status.toLowerCase() ==
                                                    "canceled"
                                                ? Colors.red
                                                : Colors.orange,
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 84,
                                          height: 84,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            child: Image.asset(
                                              item.picture,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(item.itemname),
                                                SizedBox(width: 150),
                                                Text(item.itemid),
                                              ],
                                            ),
                                            SizedBox(height: 12),
                                            Row(
                                              children: [
                                                Text('\$${item.itemprice}'),
                                                SizedBox(width: 6),
                                                Text('|  ${item.itemquantity}'),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 6),
                                    Container(
                                      width: double.infinity,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                side: BorderSide(
                                                  color: Colors.deepOrange,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: Text(
                                                "Rate",
                                                style: TextStyle(
                                                  color: Colors.deepOrange,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 44),
                                          Expanded(
                                            flex: 1,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.deepOrange,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: Text(
                                                "Re-Order",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
