import 'package:flutter/foundation.dart';
import 'item.dart';
import 'catlog_model.dart';

class CartModel extends ChangeNotifier{

  /// The private field backing [catalog].
  late CatlogModel _catalog;

  /// Internal, private state of the cart. Stores the ids of each item.
  final List<int> _itemIds = [];

  /// The current catalog. Used to construct items from numeric ids.
  CatlogModel get catalog => _catalog;

  // CatlogModel get catalog
  // {
  //   return _catalog;
  // }

  set catalog(CatlogModel newCatalog) {
    _catalog = newCatalog;
    // Notify listeners, in case the new catalog provides information
    // different from the previous one. For example, availability of an item
    // might have changed.
    notifyListeners();
  }

  //the toList() method is used to convert the iterable of Item objects
  // returned by the map method to a list of Item objects.
  List<Item> get items {
    List<Item> itemList = _itemIds.map((id) {
      return _catalog.getById(id);
    }).toList();
    return itemList;
  }
  //the CatalogModel class likely has a method called getById that takes an id parameter
// and returns the corresponding Item object.
// This suggests that Item is a class that represents a catalog item,
// and that the CatalogModel class provides a way to retrieve Item objects by their numeric ids.


  /// The current total price of all items.
  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(Item item) {
    _itemIds.add(item.id);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
    // Don't forget to tell dependent widgets to rebuild _every time_
    // you change the model.
    notifyListeners();
  }

}