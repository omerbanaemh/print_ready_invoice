import 'package:flutter/material.dart';
import 'package:print_ready_invoice/features/invoice/domin/entities/product_details_entity.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/client_details_section.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/project_details_section.dart';

class InvoiceInfoSection extends StatelessWidget {
  const InvoiceInfoSection({super.key, r});

// final ProductDetailsEntity productDetails;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: ClientDetailsSection(),
        ),
        Expanded(
          child: ProjectDetailsSection(),
        ),
      ],
    );
  }
}


