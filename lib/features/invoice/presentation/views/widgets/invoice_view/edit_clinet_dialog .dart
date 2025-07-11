import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:print_ready_invoice/core/utils/size_config.dart';
import 'package:print_ready_invoice/features/invoice/models/clinet_model.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/cubit/clinet_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/cubit/invoice_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/custom_input_decoration.dart';

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
                    hintText: 'hintText',
                    context: context,
                  ),
                ),
                FormBuilderTextField(
                  initialValue: clinet.address,
                  name: 'address',
                  decoration: customInputDecoration(
                    hintText: 'hintText',
                    context: context,
                  ),
                ),
                FormBuilderTextField(
                  initialValue: clinet.email,
                  name: 'email',
                  decoration: customInputDecoration(
                    hintText: 'hintText',
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
          child: const Text('إلغاء'),
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
          child: const Text('حفظ'),
        ),
      ],
    );
  }
}
