import 'package:bloc_demo/app_router.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
