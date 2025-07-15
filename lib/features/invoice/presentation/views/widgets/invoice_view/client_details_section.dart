import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';
import 'package:print_ready_invoice/features/invoice/domin/entities/client_entity.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/cubit/client_details_cubit/clinet_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/edit_clinet_dialog.dart';
import 'package:print_ready_invoice/generated/l10n.dart';

class ClientDetailsSection extends StatelessWidget {
  const ClientDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientCubit, ClientState>(
      builder: (context, state) {
        if(state is ClientLoadied){
          final ClientEntity client =state.client;
          return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).bill_to, style: AppStyles.styleSemiBold16(context).copyWith(color: Colors.black)),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => EditUserDialog(
                    clinet: ClientEntity(
                      name: client.name,
                      address: client.address,
                      email: client.email,
                    ),
                  ),
                );
              },
              child: Text(
               client.name ??'',
                style: AppStyles.styleSemiBold16(
                  context,
                ).copyWith(color: Colors.blue),
              ),
            ),
            Text(
              client.address??'',
              style: AppStyles.styleRegular14(
                context,
              ).copyWith(color: Colors.black38),
            ),
            Text(
              client.email??'',
              style: AppStyles.styleRegular14(
                context,
              ).copyWith(color: Colors.black38),
            ),
          ],
        );
        } 
        return const SizedBox();             
      },
    );
  }
}
