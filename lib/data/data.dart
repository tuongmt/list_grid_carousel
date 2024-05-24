import 'package:listview_grid_carousel/model/product.dart';

createDataList(int amount) {
  List<ProductModel> productList = [];
  for (int i = 1; i <= amount; i++) {
    productList.add(ProductModel(
        id: i,
        name: "Smartphone $i",
        price: (i * 1000000),
        image: "img_$i.jpg",
        description: "Iphone"));
  }
  return productList;
}
