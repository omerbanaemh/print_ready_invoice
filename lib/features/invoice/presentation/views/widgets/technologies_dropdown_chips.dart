import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/custom_input_decoration.dart';

class TechnologiesDropdownChips extends StatefulWidget {
  const TechnologiesDropdownChips({super.key});

  @override
  State<TechnologiesDropdownChips> createState() =>
      _TechnologiesDropdownChipsState();
}

class _TechnologiesDropdownChipsState extends State<TechnologiesDropdownChips> {
  final List<String> technologies = [
    'TypeScript',
    'Genkit',
    'Firebase',
    'Node.js',
  ];
  List<String> selectedValues = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24),
         Text(
          'Technologies Used',
          style: AppStyles.styleMedium16(context),
        ),
        SizedBox(height: 8),
        FormBuilderField<List<String>>(
          name: 'technologies_used',
          initialValue: selectedValues,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select at least one technology';
            }
            return null;
          },
          builder: (field) {
            return InputDecorator(
              decoration: customInputDecoration(
                hintText: 'Select a Project Type',context: context,
                errorText: field.errorText,
              ),
              child: Wrap(
                spacing: 8,
                runSpacing: 4,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  ...selectedValues.map(
                    (tech) => InputChip(
                      label: Text(tech),
                      onDeleted: () {
                        setState(() {
                          selectedValues.remove(tech);
                        });
                        field.didChange(selectedValues);
                      },
                    ),
                  ),
                  DropdownButton<String>(
                    key: UniqueKey(),
                    value: null,
                    hint: const Text("Select Technologies..."),
                    underline: const SizedBox(),
                    icon: const Icon(Icons.arrow_drop_down),
                    items: technologies
                        .where((item) => !selectedValues.contains(item))
                        .map(
                          (item) => DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null &&
                          !selectedValues.contains(value)) {
                        setState(() {
                          selectedValues.add(value);
                        });
                        field.didChange(selectedValues);
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}