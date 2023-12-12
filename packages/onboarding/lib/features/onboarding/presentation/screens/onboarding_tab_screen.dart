import 'package:flutter/material.dart';
import 'package:personal_account/personal_account_routes.dart';
import 'package:store_core/store_core.dart';

class OnbardingTabScreen extends StatelessWidget {
  const OnbardingTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final router = storeDI.get<StoreCore>().router;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Text("Onboarding Tab Screen"),
            MaterialButton(
              onPressed: () =>
                  router.push(PersonalAccountRoutes.personalAccount),
              color: Colors.purple,
              child: const Text("To personal account"),
            ),
          ],
        ),
      ),
    );
  }
}
