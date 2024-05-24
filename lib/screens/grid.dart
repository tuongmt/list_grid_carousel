import 'package:flutter/material.dart';
import 'package:listview_grid_carousel/model/product.dart';
import '../data/data.dart';
import 'package:intl/intl.dart';
import '../config/const.dart';

class MyGrid extends StatefulWidget {
  const MyGrid({super.key});

  @override
  State<MyGrid> createState() => _MyGridState();
}

class _MyGridState extends State<MyGrid> {
  List<ProductModel> lstProduct = [];

  @override
  void initState() {
    super.initState();
    lstProduct = createDataList(10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Grid Product: Your name"), // change to your name
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: GridView.builder(
            itemCount: lstProduct.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // set number column
              childAspectRatio: 1,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return itemGridView(lstProduct[index]);
            }),
      ),
    );
  }

  // create sub widget
  Widget itemGridView(ProductModel productModel) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            img_url + productModel.image!,
            height: 80,
            width: 80,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image),
          ),
          Text(
            productModel.name ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            NumberFormat('Price: ###,###.###').format(productModel.price),
            style: const TextStyle(fontSize: 15, color: Colors.red),
          ),
          Text(
            productModel.description!,
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
