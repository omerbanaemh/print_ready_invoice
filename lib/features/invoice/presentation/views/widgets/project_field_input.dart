import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/custom_input_decoration.dart';

class ProjectFieldInput extends StatelessWidget {
  const ProjectFieldInput({super.key, required this.label, required this.name, this.hintText, this.maxLines});
  final String label , name;
  final String? hintText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        FormBuilderTextField(
          name: name ,
          decoration: customInputDecoration(
            hintText: hintText ,
          ),
          validator: FormBuilderValidators.required(),
          maxLines: maxLines,
        ),
      ],
    );
  }
}
