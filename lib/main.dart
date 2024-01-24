import 'package:flutter/material.dart';

import 'app_router.dart';

void main() {
  runApp(
    BLoCApp(
      appRouter: AppRouter(),
    ),
  );
}

class BLoCApp extends StatelessWidget {
  const BLoCApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(
    BuildContext context,
  ) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRouter.charactersScreen,
    );
  }
}
