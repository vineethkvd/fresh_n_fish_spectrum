import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controller/get-product-data-controller.dart';

import '../../Models/product-model.dart';

class GetProductWidget extends StatefulWidget {
  const GetProductWidget({super.key});

  @override
  State<GetProductWidget> createState() => _GetProductWidgetState();
}

class _GetProductWidgetState extends State<GetProductWidget> {
  final GetProductDataController _getProductDataController =
      Get.put(GetProductDataController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
          future: _getProductDataController.getProductData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Return a loading indicator or placeholder widget
              return SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: const Center(child: CircularProgressIndicator()));
            } else if (snapshot.hasError) {
              // Handle error
              return Text('Error: ${snapshot.error}');
            } else {
              // Data has been loaded successfully
              List<QueryDocumentSnapshot<Object?>> data = snapshot.data!;
              int dataLength = data.length;

              // Rest of your widget tree using the 'data'

              return Text(   "${data.isNotEmpty ? data[0]['productName'] : 'N/A'} length: $dataLength",);
            }
          },
        ),
      ],
    );
  }
}
