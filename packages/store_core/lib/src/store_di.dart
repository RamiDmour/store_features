import 'package:get_it/get_it.dart';
import 'package:store_core/store_core.dart';

final storeDI = GetIt.instance;

Future<void> initDI({
  List<StoreModule> modules = const [],
  required GoRouter Function(List<GoRoute> routes) routerBuilder,
}) async {
  final core = await StoreCore.create(
    modules: modules,
    routerBuilder: routerBuilder,
  );
  storeDI.registerSingleton<StoreCore>(core);
}
