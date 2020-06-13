import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imgUrl;
  bool isFavorite;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imgUrl,
      this.isFavorite = false});

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

class ProductsProvider with ChangeNotifier {
  List<Product> _products = [
    Product(
      id: 'p1',
      title: 'Blue Trouser',
      description:
          'A Blue Trouser - it is pretty blue! \n you can wear it anytime anywhere \n  you can wear it anytime anywhere \n  you can wear it anytime anywhere',
      price: 29.99,
      imgUrl: "assets/images/trouser.png",
    ),
    Product(
      id: 'p2',
      title: 'Red Shirt',
      description:
          'A red shirt - it is pretty red!  you can wear it anytime anywhere',
      price: 20.99,
      imgUrl: "assets/images/redshirt.jpg",
    ),
    Product(
      id: 'p3',
      title: 'Florish Dress',
      description:
          'A Florish Dreaa - it is pretty Florish!  you can wear it anytime anywhere ',
      price: 29.99,
      imgUrl: "assets/images/fdress.png",
    ),
    Product(
      id: 'p4',
      title: 'Red Dress',
      description:
          'A red dress - it is pretty red! \n you can wear it anytime anywhere, \n it is in fifth style enjoy the beauty',
      price: 29.99,
      imgUrl: "assets/images/rdress.jpg",
    ),
  ];
  List<Product> get products {
    return [..._products];
  }

  List<Product> get favorites {
    return _products.where((productItems) => productItems.isFavorite).toList();
  }

  Product findById(String id) {
    return _products.firstWhere((prod) => prod.id == id);
  }

  void addProduct({String id, String title, double price, String image, String description}) {
    _products.add(Product(id: id , title: title, price: price, imgUrl: image, description: description));
    notifyListeners();
  }

  void removeOneItem(String id) {
    _products.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }

}
