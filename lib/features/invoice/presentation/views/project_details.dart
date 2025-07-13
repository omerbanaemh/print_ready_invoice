import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';
import 'package:print_ready_invoice/core/utils/size_config.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/generate_invoice_button.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/primary_framework_input.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/project_field_input.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/project_type_input.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/technologies_dropdown_chips.dart';
import 'package:print_ready_invoice/generated/l10n.dart';

class ProjectDetails extends StatefulWidget {
  const ProjectDetails({super.key});
  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  final _formKey = GlobalKey<FormBuilderState>();
  final List<String> projectTypes = ['Mobile App', 'Web App', 'Desktop App'];
  final List<String> frameworks = ['Flutter', 'React', 'Nuxt.js'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text(
              S.of(context).printReady_invoice,
              style: AppStyles.styleSemiBold26(
                context,
              ).copyWith(color: Colors.blue),
            ),
            const SizedBox(height: 40),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 500),
                child: Container(
                  width: SizeConfig.width(context) * 0.45,
                  padding: const EdgeInsets.all(20),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFDFDFD),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).project_details,
                        style: AppStyles.styleSemiBold20(
                          context,
                        ).copyWith(color: Colors.black),
                      ),
                      Text(
                        S.of(context).printReady_invoice_description,
                        style: AppStyles.styleRegular12(
                          context,
                        ).copyWith(color: Colors.black),
                      ),

                      FormBuilder(
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
