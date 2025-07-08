import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/custom_input_decoration.dart';

class PrimaryFrameworkInput extends StatelessWidget {
  const PrimaryFrameworkInput({super.key, required this.frameworks});
  final List<String> frameworks;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        Text(
          'Primary Framework',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        FormBuilderDropdown<String>(
          name: 'primary_framework',
          decoration: customInputDecoration(hintText: 'Select framework...'),
          items: frameworks
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          validator: FormBuilderValidators.required(),
        ),
      ],
    );
  }
}
