import 'package:flutter/material.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_rich_text.dart';

class InvoiceInfoSection extends StatelessWidget {
  const InvoiceInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Bill To:', style: AppStyles.styleSemiBold16(context)),
              SizedBox(height: 10),
              Text(
                'Global Corp',
                style: AppStyles.styleSemiBold16(
                  context,
                ).copyWith(color: Colors.blue),
              ),
              Text(
                '456 Business Avenue, Metroplis, 67890',
                style: AppStyles.styleRegular14(
                  context,
                ).copyWith(color: Colors.black38),
              ),
              Text(
                'contact@gmail.com',
                style: AppStyles.styleRegular14(
                  context,
                ).copyWith(color: Colors.black38),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Project Details',
                style: AppStyles.styleSemiBold16(context),
              ),
              SizedBox(height: 10),
              CustomRichText(late: 'Name: ', text: 'omar'),
              CustomRichText(late: 'Type: ', text: 'osvdvbfmar'),
              CustomRichText(late: 'FrameWork: ', text: 'sd vsd'),
              CustomRichText(late: 'Technologies: ', text: 'htbhfgb gbjbjhg'),
              CustomRichText(
                late: 'Description: ',
                text: 'rrrrrrrrrrrrrrrrrrrrrrr',
              ),
            ],
          ),
        ),
      ],
    );
  }
}