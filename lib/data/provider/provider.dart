import 'package:app_riveepod_example/controllers/get_data_controller.dart';
import 'package:app_riveepod_example/data/services/conect_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serviceRest = Provider((_) => ConnectApi());
final dataProvider = ChangeNotifierProvider<DataProvider>((ref) => DataProvider(ref: ref));
