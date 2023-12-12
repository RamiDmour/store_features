library personal_account;

import 'package:personal_account/features/personal_account/presentation/screens/personal_account_screen.dart';
import 'package:personal_account/personal_account_routes.dart';
import 'package:store_core/store_core.dart';

export 'package:personal_account/personal_account_routes.dart';

class PersonalAccountModule extends StoreModule {
  @override
  List<CollectionSchema> getIsarCollections() => [];

  @override
  List<StatefulShellBranch> getShellBranches() => [];
  @override
  List<GoRoute> getRoutes() => [
        GoRoute(
          path: PersonalAccountRoutes.personalAccount,
          builder: (context, state) => const PersonalAccountScreen(),
        ),
      ];
}
