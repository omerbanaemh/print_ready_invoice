import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/custom_input_decoration.dart';

class ProjectNameInput extends StatelessWidget {
  const ProjectNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        Text('Project Name', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        FormBuilderTextField(
          name: 'name',
          decoration: customInputDecoration(
            hintText: 'E.g., Corporate Website Redesign',
          ),
          validator: FormBuilderValidators.required(),
        ),
      ],
    );
  }
}
