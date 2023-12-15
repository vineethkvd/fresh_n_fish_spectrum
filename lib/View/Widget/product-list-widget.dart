import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_card/image_card.dart';

import '../../Controller/get-product-data-controller.dart';

import '../../Models/product-model.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
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

              // Rest of your widget tree using the 'data'

              return GridView.builder(
                itemCount: data!.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 0.80,
                ),
                itemBuilder: (context, index) {
                  final productData = data[index];
                  ProductModel productModel = ProductModel(
                    productId: productData['productId'],
                    categoryId: productData['categoryId'],
                    productName: productData['productName'],
                    categoryName: productData['categoryName'],
                    salePrice: productData['salePrice'],
                    fullPrice: productData['fullPrice'],
                    productImages: productData['productImages'],
                    deliveryTime: productData['deliveryTime'],
                    isSale: productData['isSale'],
                    productDescription: productData['productDescription'],
                    createdAt: productData['createdAt'],
                    updatedAt: productData['updatedAt'],
                  );
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () => null,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            child: FillImageCard(
                              borderRadius: 20.0,
                              width: Get.width / 2.3,
                              heightImage: Get.height / 6,
                              imageProvider: CachedNetworkImageProvider(
                                productModel.productImages[0],
                              ),
                              title: Center(
                                child: Text(
                                  productModel.productName,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ),
                              footer: Center(
                                child: Text("PKR: " + productModel.fullPrice),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }
}
