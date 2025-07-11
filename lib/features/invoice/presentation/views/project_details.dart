import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';
import 'package:print_ready_invoice/core/utils/size_config.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/cubit/localization_cubit.dart';
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
    // print('width======== ${SizeConfig.width(context)}');
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.language),
              onPressed: () => context.read<LocalizationCubit>().changeLocale(
                context.read<LocalizationCubit>().locale == 'en' ? 'ar' : 'en',
              ),
              color: Theme.of(context).iconTheme.color, 
            ),
            SizedBox(height: 40),
            Text(
              S.of(context).printReady_invoice,
              style: AppStyles.styleSemiBold26(context),
            ),
            SizedBox(height: 40),
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 500),
                child: Container(
                  width: SizeConfig.width(context) * 0.45,
                  padding: EdgeInsets.all(20),
                  decoration: ShapeDecoration(
                    color: Theme.of(context).colorScheme.surface,  
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Theme.of(context).dividerColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).project_details,
                        style: AppStyles.styleSemiBold20(context).copyWith(
                      color: Theme.of(context).textTheme.headlineLarge?.color,
                    ),
                        
                      ),
                      Text(
                        S.of(context).printReady_invoice_description,
                        style: AppStyles.styleRegular12(context).copyWith(
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                      ),

                      FormBuilder(
                        key: _formKey,
                        child: Column(
                          children: [
                            ProjectFieldInput(
                              label: S.of(context).project_name,
                              name: 'name',
                              hintText: S.of(context).project_name_hint,
                            ),
                            ProjectTypeInput(projectTypes: projectTypes),
                            ProjectFieldInput(
                              label: S.of(context).project_description,
                              name: 'description',
                              hintText:
                                  S.of(context).project_description_hint,
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
