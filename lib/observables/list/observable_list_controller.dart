import 'package:mobx/mobx.dart';
import 'package:mobx_imx/model/product_model.dart';
part 'observable_list_controller.g.dart';

class ObservableListController = ObservableListControllerBase with _$ObservableListController;

abstract class ObservableListControllerBase with Store {

  @observable
  var products = <ProductModel>[].asObservable();
  // var products = <ProductModel>[];
  // ObservableList products = ObservableList();

  @action
  void loadProducts() {
    var productsData = [
      ProductModel(name: 'Computador'),
      ProductModel(name: 'Celular'),
      ProductModel(name: 'Teclado'),
      ProductModel(name: 'Mouse'),
    ];
    products.addAll(productsData) ;
    // products = productsData;
  }

  @action
  void addProduct() {
    products.add(ProductModel(name: 'Computador'));
    // var productsNew = [...products];
    // products = productsNew;
  }
  
  @action
  void removeProduct() {
    products.removeAt(0);
  }

}