import 'package:fruit_hub_dashboard/dashboard_view.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/view/add_product_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final String bestSellingView = '/bestSellingView';
  static final String addProductView = '/addProductView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => DashboardView(),
      ),
      GoRoute(
        path: addProductView,
        builder: (context, state) => AddProductView(),
      ),
    ],
  );
}
