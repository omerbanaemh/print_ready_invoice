import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/custom_input_decoration.dart';

class ProjectTypeInput extends StatelessWidget {
  const ProjectTypeInput({super.key, required this.projectTypes});
  final List<String> projectTypes;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24),
        Text('Project Type', style: AppStyles.styleMedium16(context)),
        SizedBox(height: 8),
        FormBuilderDropdown<String>(
          name: 'project_type',
          decoration: customInputDecoration(hintText: 'Select a Project Type',context: context),
          items: projectTypes
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          validator: FormBuilderValidators.required(),
        ),
      ],
    );
  }
}
