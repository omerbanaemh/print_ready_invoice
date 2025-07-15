import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';
import 'package:print_ready_invoice/core/utils/size_config.dart';
import 'package:print_ready_invoice/features/invoice/domin/entities/client_entity.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/cubit/client_details_cubit/clinet_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/project_field_input.dart';
import 'package:print_ready_invoice/generated/l10n.dart';

class EditUserDialog extends StatelessWidget {
  final ClientEntity clinet;

  const EditUserDialog({super.key, required this.clinet});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      content: ConstrainedBox(
        constraints: BoxConstraints(minWidth: SizeConfig.width(context) * 0.3),
        child: FormBuilder(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                  Text(S.of(context).edit_client, style:  AppStyles.styleSemiBold18(context),),
                  Text(S.of(context).client_details),
                ProjectFieldInput(
                  label: S.of(context).name,
                  name: 'name',
                  initialValue: clinet.name,
                  hintText: S.of(context).name
                ),
                ProjectFieldInput(
                  label: S.of(context).address,
                  name: 'address',
                  initialValue: clinet.address,
                  hintText: S.of(context).address,
                ),
                ProjectFieldInput(
                  label: S.of(context).email,
                  name: 'email',
                  initialValue: clinet.email,
                  hintText: S.of(context).email,
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(S.of(context).cancel),
        ),
        ElevatedButton(
           style: ElevatedButton.styleFrom(
          backgroundColor:  Colors.blue,
          foregroundColor: Colors.white,
        ),
          onPressed: () {
            if (formKey.currentState?.saveAndValidate() ?? false) {
              final values = formKey.currentState!.value;
              final updatedClient = ClientEntity(
                name: values['name'],
                address: values['address'],
                email: values['email'],
              );

              context.read<ClientCubit>().updateClientDetails(updatedClient);
              Navigator.of(context).pop();
            }
          },
          child: Text(S.of(context).save_changes),
        ),
      ],
    );
  }
}
