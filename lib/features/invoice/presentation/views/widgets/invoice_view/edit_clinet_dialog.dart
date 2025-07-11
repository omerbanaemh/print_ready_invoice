import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:print_ready_invoice/core/utils/size_config.dart';
import 'package:print_ready_invoice/features/invoice/models/clinet_model.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/cubit/clinet_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/custom_input_decoration.dart';
import 'package:print_ready_invoice/generated/l10n.dart';

class EditUserDialog extends StatelessWidget {
  final ClinetModel clinet;

  const EditUserDialog({super.key, required this.clinet});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

    return AlertDialog(
      title: const Text('تعديل البيانات'),
      content: ConstrainedBox(
        constraints: BoxConstraints(minWidth: SizeConfig.width(context) * 0.3),
        child: FormBuilder(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FormBuilderTextField(
                  initialValue: clinet.name,
                  name: 'name',
                  decoration: customInputDecoration(
                    hintText: S.of(context).name,
                    context: context,
                  ),
                ),
                FormBuilderTextField(
                  initialValue: clinet.address,
                  name: S.of(context).address,
                  decoration: customInputDecoration(
                    hintText: 'Address',
                    context: context,
                  ),
                ),
                FormBuilderTextField(
                  initialValue: clinet.email,
                  name: S.of(context).email,
                  decoration: customInputDecoration(
                    hintText: 'Email',
                    context: context,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(S.of(context).cancel),
        ),
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState?.saveAndValidate() ?? false) {
              final values = formKey.currentState!.value;
              final updatedClient = ClinetModel(
                name: values['name'],
                address: values['address'],
                email: values['email'],
              );

              context.read<ClinetCubit>().updateClinet(updatedClient);
              Navigator.of(context).pop();
            }
          },
          child: Text(S.of(context).save),
        ),
      ],
    );
  }
}
