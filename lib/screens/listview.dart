import 'package:flutter/material.dart';
import 'package:listview_grid_carousel/model/product.dart';
import '../data/data.dart';
import 'package:intl/intl.dart';
import '../config/const.dart';

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
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
        title: const Text("My List Product: Your name"), // change to your name
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: lstProduct.length,
          itemBuilder: (context, index) {
            return itemListView(lstProduct[index]);
          }),
      ),
    );
  }

  // create sub widget
  Widget itemListView(ProductModel productModel) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, 
        children: [
          Image.asset(
            img_url + productModel.image!,
            height: 80,
            width: 80,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.image),
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productModel.name ?? '',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                "Price: ${NumberFormat('###,###.###').format(productModel.price)}",
                style: const TextStyle(fontSize: 14, color: Colors.red),
              ),
              Text(
                productModel.description!,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
