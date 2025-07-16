import 'package:flutter/material.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';
import 'package:print_ready_invoice/features/invoice/domin/entities/product_details_entity.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_rich_text.dart';
import 'package:print_ready_invoice/generated/l10n.dart';

class ProjectDetailsSection extends StatelessWidget {
  const ProjectDetailsSection({
    super.key,
  });

  // final ProductDetailsEntity productDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).project_details,
          style: AppStyles.styleSemiBold16(context).copyWith(color: Colors.black),
        ),
        const SizedBox(height: 10),
        CustomRichText(late: S.of(context).name_, text: 'productDetails.name'),
        CustomRichText(late: S.of(context).type, text:' productDetails.type'),
        CustomRichText(late: S.of(context).framework, text: 'productDetails.frameWork'),
        CustomRichText(late: S.of(context).technologies, text: 'productDetails.technologies.join'),
        CustomRichText(
          late: S.of(context).description,
          text: 'productDetails.description?? ''',
        ),
      ],
    );
  }
}
