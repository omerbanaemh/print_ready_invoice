import 'package:go_router/go_router.dart';
import 'package:print_ready_invoice/features/invoice/domin/entities/product_details_entity.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/invoice_view.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/project_details.dart';

abstract class AppRouter {
  static const kInvoiceView = '/invoiceView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const ProjectDetails()),
      GoRoute(
        path: kInvoiceView,
        builder: (context, state) {
          final productDetails = state.extra as ProductDetailsEntity;
          return InvoiceView(productDetails: productDetails);
        },
      ),
    ],
  );
}
