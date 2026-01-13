import 'package:flutter/material.dart';
import 'core/app_colors.dart';
import 'core/routes.dart';
import 'screens/get_started_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/app_shell.dart';
import 'state/session_store.dart';
import 'state/products_model.dart';

final session = SessionStore();
final productsModel = ProductsModel();

void main() {
  runApp(const TasteHubApp());
}

class TasteHubApp extends StatelessWidget {
  const TasteHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TasteHub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bg,
        useMaterial3: true,
      ),
      initialRoute: Routes.getStarted,
      routes: {
        Routes.getStarted: (_) => const GetStartedScreen(),
        Routes.auth: (_) => AuthScreen(session: session),
        Routes.app: (_) => AppShell(session: session, products: productsModel),
      },
    );
  }
}
