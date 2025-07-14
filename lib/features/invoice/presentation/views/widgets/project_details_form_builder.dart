import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/generate_invoice_button.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/primary_framework_input.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/project_field_input.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/project_type_input.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/technologies_dropdown_chips.dart';
import 'package:print_ready_invoice/generated/l10n.dart';

class ProjectDetailsFormBuilder extends StatefulWidget {
  const ProjectDetailsFormBuilder({super.key});

  @override
  State<ProjectDetailsFormBuilder> createState() =>
      _ProjectDetailsFormBuilderState();
}

class _ProjectDetailsFormBuilderState extends State<ProjectDetailsFormBuilder> {
  final _formKey = GlobalKey<FormBuilderState>();
  final List<String> projectTypes = ['Mobile App', 'Web App', 'Desktop App'];
  final List<String> frameworks = ['Flutter', 'React', 'Nuxt.js'];
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          ProjectFieldInput(
            label: S.of(context).project_name,
            name: 'name',
            hintText: S.of(context).project_name_hint,
            required: true,
          ),
          ProjectTypeInput(projectTypes: projectTypes),
          ProjectFieldInput(
            label: S.of(context).project_description,
            name: 'description',
            hintText: S.of(context).project_description_hint,
            maxLines: 3,
          ),
          PrimaryFrameworkInput(frameworks: frameworks),
          const TechnologiesDropdownChips(),
          GenerateInvoiceButton(formKey: _formKey),
        ],
      ),
    );
  }
}
