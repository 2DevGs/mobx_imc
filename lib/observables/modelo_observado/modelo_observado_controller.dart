import 'package:mobx/mobx.dart';
import 'package:mobx_imx/model/product_model.dart';
import 'package:mobx_imx/observables/modelo_observado/model/product_store.dart';
part 'modelo_observado_controller.g.dart';

class ModeloObservadoController = ModeloObservadoControllerBase with _$ModeloObservadoController;

abstract class ModeloObservadoControllerBase with Store {

  @observable
  var products = <ProductStore>[].asObservable();
  // var products = <ProductModel>[];
  // ObservableList products = ObservableList();

  @action
  void loadProducts() {
    var productsData = [
      ProductStore(product: ProductModel(name: 'Computador'), selected: false),
      ProductStore(product: ProductModel(name: 'Celular'), selected: false),
      ProductStore(product: ProductModel(name: 'Teclado'), selected: false),
      ProductStore(product: ProductModel(name: 'Mouse'), selected: false),
    ];
    products.addAll(productsData) ;
    // products = productsData;
  }

  @action
  void addProduct() {
    products.add(ProductStore(product: ProductModel(name: 'Computador'), selected: false));
    // var productsNew = [...products];
    // products = productsNew;
  }
  
  @action
  void removeProduct() {
    products.removeAt(0);
  }

  @action
  void selectedProduct(int index) {
    var productSelect = products[index].selected;
    products[index].selected = !productSelect;
  }

}