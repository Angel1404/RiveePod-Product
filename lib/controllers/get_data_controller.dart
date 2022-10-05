import 'package:app_riveepod_example/data/provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/product_model.dart';

class DataProvider extends ChangeNotifier {
  DataProvider({required this.ref});

  final Ref ref;
  bool isLoading = false;
  bool isError = false;
  bool valor = false;
  List<Product> productosModel = [];

  Future getData() async {
    final conectApi = ref.read(serviceRest);

    try {
      isLoading = true;
      productosModel = await conectApi.getProducts();
      print(productosModel);
      isLoading = false;
    } catch (e) {
      isError = true;
      print(e);
    }
    notifyListeners();
  }

  cambiarValor() {
    valor = !valor;
    notifyListeners();
  }
}
