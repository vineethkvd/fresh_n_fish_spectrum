import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class GetProductDataController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Object?>>> getProductData(
      String categoryId) async {
    final QuerySnapshot categoryData = await _firestore
        .collection('products')
        .where('categoryId', isEqualTo: categoryId)
        .get();
    return categoryData.docs;
  }
}
