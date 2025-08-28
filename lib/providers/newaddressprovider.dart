import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/newaddressscreen.dart';

final newAddressControllerProvider = Provider<NewAddressController>(
  (ref) => NewAddressController(),
);

final selectedAddressProvider = StateProvider<String?>((ref) => null);
