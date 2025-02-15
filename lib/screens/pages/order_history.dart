import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import '../../model/show_history.dart';
import '../../utils/const.dart';
import '../../utils/globel_veriable.dart';
import '../home/container_radius.dart';
import '../pages/order_tracking_screen.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  Future<ShowOrderModel> getOrderHistory() async {
    final response = await post(
        Uri.parse('${apiUrl}getOrderData?user_id=${GlobalK.userId}'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      if (data['error'] == false) {
        return ShowOrderModel.fromJson(data);
      } else {
        Fluttertoast.showToast(msg: response.reasonPhrase.toString());
      }
    } else {
      Fluttertoast.showToast(msg: response.reasonPhrase.toString());
    }
    throw Exception('Unable to load data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 16,
              color: Colors.grey.shade700,
            )),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        foregroundColor: Colors.black,
        title: Text(
          'ORDER HISTORY',
          style: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<ShowOrderModel>(
          future: getOrderHistory(),
          builder: (context, snapshot) => snapshot.hasData
              ? snapshot.data!.orders!.isEmpty
                  ? Center(
                      child: Text(
                        'You have not ordered any product yet',
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.orders!.length,
                      itemBuilder: (context, index) => OrdersCard(
                        snapshot: snapshot,
                        index: index,
                      ),
                    )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}

class OrdersCard extends StatelessWidget {
  final AsyncSnapshot<ShowOrderModel> snapshot;
  final int index;

  OrdersCard({
    super.key,
    required this.snapshot,
    required this.index,
  });

  final normalText =
      TextStyle(fontSize: 12, fontFamily: GoogleFonts.lato().fontFamily);
  final largeText =
      TextStyle(fontSize: 14, fontFamily: GoogleFonts.lato().fontFamily);
  final normalColorText = TextStyle(
      fontSize: 18,
      fontFamily: GoogleFonts.lato().fontFamily,
      color: Colors.amber.shade800);

  @override
  Widget build(BuildContext context) {
    final address = snapshot.data!.orders![index].address!;
    final orderId = snapshot.data!.orders![index].orderid;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order ID : $orderId', style: largeText),
                Text(
                    snapshot.data!.orders![index].orderdetails![0].createdAt!
                        .split('T')
                        .first,
                    style: normalText),
              ],
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: snapshot.data!.orders![index].orderdetails!.length,
            itemBuilder: (context, ind) => ordersItemCard(snapshot, ind, size, context),
          )
        ],
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.only(top: 8),
    //   child: RoundedContainer(
    //     padding: const EdgeInsets.all(8),
    //     color: Colors.black12,
    //     isImage: false,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Row(
    //           mainAxisSize: MainAxisSize.max,
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text('Order ID : $orderId!', style: largeText),
    //             Text(
    //                 snapshot.data!.orders![index].orderdetails![0].createdAt!
    //                     .split('T')
    //                     .first,
    //                 style: normalText),
    //           ],
    //         ),
    //         // Text('Delivery Address : ', style: normalColorText),
    //         // Text(
    //         //     '${address.cname!},\n${address.address1!} ${address.landmark}, ${address.city!},\n${address.state}, India\nPin Code : ${address.pincode}\nMobile No : ${address.mobile}',
    //         //     style: normalText),
    //         ListView.builder(
    //           physics: const NeverScrollableScrollPhysics(),
    //           shrinkWrap: true,
    //           itemCount: snapshot.data!.orders![index].orderdetails!.length,
    //           itemBuilder: (context, ind) =>
    //               ordersItemCard(snapshot, ind, size),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }

  ordersItemCard(AsyncSnapshot<ShowOrderModel> snapshot, int ind, Size size, BuildContext context) {
    final item = snapshot.data!.orders![index].orderdetails![ind];
    
    // Function to get status color
    Color getStatusColor(String? status) {
      switch(status?.toLowerCase()) {
        case 'delivered':
          return Colors.green;
        case 'confirmed':
          return Colors.blue;
        case 'ready':
          return Colors.orange;
        case 'cancelled':
          return Colors.red;
        default:
          return Colors.grey;
      }
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderTrackingScreen(
              order: snapshot.data!.orders![index],
              orderDetailIndex: ind,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: RoundedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          borderColor: Colors.grey.shade500,
          isImage: false,
          color: Colors.white,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            // Make sure the Row shrinks to fit its content
            children: [
              RoundedContainer(
                height: 150,
                width: size.width * 0.4,
                isImage: true,
                networkImg: '$imgPath/products/${item.image}',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                // Column should take only necessary space
                children: [
                  Container(
                    width: size.width * 0.3, // Provide a fixed width
                    child: Text(
                      item.productname!.toUpperCase(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text('Gold Purity'),
                        // No need for Expanded or Flexible here
                        Container(
                          width: size.width * 0.25,
                          // Give the second part some fixed width
                          alignment: Alignment.centerRight,
                          child: Text('${item.goldPurity ?? '22kt'}'),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text('Bangle Size'),
                        // No need for Expanded or Flexible here
                        Container(
                          width: size.width * 0.22,
                          // Give the second part some fixed width
                          alignment: Alignment.centerRight,
                          child: Text('${item.bangleSize ?? '2 - 8'}'),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text('Weight'),
                        // No need for Expanded or Flexible here
                        Container(
                          width: size.width * 0.31,
                          // Give the second part some fixed width
                          alignment: Alignment.centerRight,
                          child: Text('${item.weight}g'),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text('Status   '),
                        Container(
                          width: size.width * 0.32,
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${item.activeStatus}',
                            style: TextStyle(
                              color: getStatusColor(item.activeStatus),
                              fontWeight: FontWeight.w500,
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
        ),
      ),
    );
  }
}
