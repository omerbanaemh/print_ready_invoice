
import 'package:flutter/material.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/custom_background_container.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/project_details_form_builder.dart';
import 'package:print_ready_invoice/generated/l10n.dart';

class ProjectDetailsBody extends StatelessWidget {
  const ProjectDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Text(
            S.of(context).printReady_invoice,
            style: AppStyles.styleSemiBold26(
              context,
            ).copyWith(color: Colors.blue),
          ),
          const SizedBox(height: 40),
          CustomBackgroundContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).project_details,
                  style: AppStyles.styleSemiBold20(
                    context,
                  ).copyWith(color: Colors.black),
                ),
                Text(
                  S.of(context).printReady_invoice_description,
                  style: AppStyles.styleRegular12(
                    context,
                  ).copyWith(color: Colors.black),
                ),
                const ProjectDetailsFormBuilder(),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
