import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';
import 'package:print_ready_invoice/generated/l10n.dart';

class GenerateInvoiceButton extends StatelessWidget {
  const GenerateInvoiceButton({super.key, required this.formKey});

  final GlobalKey<FormBuilderState> formKey;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
              foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            onPressed: () {
              if (formKey.currentState!.saveAndValidate()) {
                final data = formKey.currentState!.value;
              }
            },
            child: SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(
                  S.of(context).generate_invoice,
                  style: AppStyles.styleMedium16(context).copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
