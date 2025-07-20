import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/custom_input_decoration.dart';

class ProjectFieldInput extends StatelessWidget {
  const ProjectFieldInput({super.key, required this.label, required this.name, this.hintText, this.maxLines, this.initialValue, this.required = false});
  final String label , name;
  final String? hintText, initialValue;
  final int? maxLines;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(label, style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: 8),
        FormBuilderTextField(
          name: name ,
          initialValue: initialValue,
          decoration: customInputDecoration(
            hintText: hintText ,context: context
          ),

          validator: required ? FormBuilderValidators.required() : null,
          maxLines: maxLines,
        ),
      ],
    );
  }
}
