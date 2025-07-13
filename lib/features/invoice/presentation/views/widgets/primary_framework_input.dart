import 'package:flutter/material.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/custom_input_decoration.dart';
import 'package:print_ready_invoice/generated/l10n.dart';

class PrimaryFrameworkInput extends StatelessWidget {
  const PrimaryFrameworkInput({super.key, required this.frameworks});
  final List<String> frameworks;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          S.of(context).project_framework,
          style: AppStyles.styleMedium16(context).copyWith(color: Colors.black),
        ),
        const SizedBox(height: 8),

        FormBuilderSearchableDropdown<String>(
          name: 'primary_framework',
          decoration: customInputDecoration(
            hintText: S.of(context).project_framework_hint,
            context: context,
          ),
          items: frameworks,
          popupProps: const PopupProps.menu(
            showSearchBox: true,
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(hintText: ' S.of(context).search'),
            ),
          ),
          validator: FormBuilderValidators.required(
            // errorText:" S.of(context).please_select_framework",
          ),
        ),
      ],
    );
  }
}
