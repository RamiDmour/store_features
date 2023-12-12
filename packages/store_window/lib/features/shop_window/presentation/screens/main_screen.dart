import 'package:flutter/material.dart';
import 'package:store_core/store_core.dart';
import 'package:store_window/store_window_routes.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text('Main Screen'),
            MaterialButton(
              onPressed: () => storeDI
                  .get<StoreCore>()
                  .router
                  .push(StoreWindowRoutes.secondMain),
              child: const Text('Second Main'),
            ),
          ],
        ),
      ),
    );
  }
}
