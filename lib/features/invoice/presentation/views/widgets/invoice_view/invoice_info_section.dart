import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';
import 'package:print_ready_invoice/features/invoice/models/clinet_model.dart';
import 'package:print_ready_invoice/features/invoice/models/product_details_model.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/cubit/clinet_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_rich_text.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/edit_clinet_dialog%20.dart';
import 'package:print_ready_invoice/generated/l10n.dart';

class InvoiceInfoSection extends StatelessWidget {
  const InvoiceInfoSection({super.key, required this.productDetails});

final ProductDetailsModel productDetails;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BlocBuilder<ClinetCubit, ClinetState>(
            builder: (context, state) {
              final cubit = context.read<ClinetCubit>();               
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context).bill_to, style: AppStyles.styleSemiBold16(context)),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => EditUserDialog(
                          clinet: ClinetModel(
                            name: cubit.clinetName,
                            address: cubit.address,
                            email: cubit.email,
                          ),
                        ),
                      );
                    },
                    child: Text(
                     cubit.clinetName,
                      style: AppStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: Colors.blue),
                    ),
                  ),
                  Text(
                    cubit.address,
                    style: AppStyles.styleRegular14(
                      context,
                    ).copyWith(color: Colors.black38),
                  ),
                  Text(
                    cubit.email,
                    style: AppStyles.styleRegular14(
                      context,
                    ).copyWith(color: Colors.black38),
                  ),
                ],
              );
            },
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).project_details,
                style: AppStyles.styleSemiBold16(context),
              ),
              SizedBox(height: 10),
              CustomRichText(late: S.of(context).name_, text: productDetails.name),
              CustomRichText(late: S.of(context).type, text: productDetails.type),
              CustomRichText(late: S.of(context).framework, text: productDetails.frameWork),
              CustomRichText(late: S.of(context).technologies, text: productDetails.technologies[0]),
              CustomRichText(
                late: S.of(context).description,
                text: productDetails.description,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
