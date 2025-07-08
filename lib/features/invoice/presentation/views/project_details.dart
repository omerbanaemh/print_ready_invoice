import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';
import 'package:print_ready_invoice/core/utils/size_config.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/generate_invoice_button.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/primary_framework_input.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/project_field_input.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/project_type_input.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/technologies_dropdown_chips.dart';

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
    print('width======== ${SizeConfig.width(context)}');
    return Scaffold(
      backgroundColor: const Color(0xFFECEEF0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Text(
              'PrintReady Invoice',
              style: TextStyle(
                color: Color(0xFF4192DF),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 500),
                child: Container(
                  width: SizeConfig.width(context) * 0.45,
                  padding: EdgeInsets.all(20),
                  decoration: ShapeDecoration(
                    color: Color(0xFFFDFDFD),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFD6D8DB)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Project Details',
                        style: AppStyles.styleSemiBold24(context)
                      ),
                      Text('PrintReady Invoice dvsdv ds af fdsa f fdsafds',style: AppStyles.styleRegular12(context),),

                      FormBuilder(
                        key: _formKey,
                        child: Column(
                          children: [
                            ProjectFieldInput(
                              label: 'Project Name',
                              name: 'name',
                              hintText: 'E.g., Corporate Website Redesign',
                            ),
                            ProjectTypeInput(projectTypes: projectTypes),
                            ProjectFieldInput(
                              label: 'Description (Optional)',
                              name: 'description',
                              hintText:
                                  'Provide a brief description of project',
                              maxLines: 3,
                            ),
                            PrimaryFrameworkInput(frameworks: frameworks),
                            TechnologiesDropdownChips(),
                            GenerateInvoiceButton(formKey: _formKey),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
