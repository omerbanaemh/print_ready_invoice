import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';
import 'package:print_ready_invoice/features/invoice/models/product_model.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/cubit/invoice_cubit.dart';
import 'package:print_ready_invoice/generated/l10n.dart';

class InvoiceTable extends StatelessWidget {
  const InvoiceTable({
    super.key,
    required this.productItems,
    required this.cubit,
  });

  final List<ProductModel> productItems;
  final InvoiceCubit cubit;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      child: DataTable(
        dataRowMaxHeight: 55,
        headingRowColor: WidgetStateProperty.all(Color(0xFFEDEFF2)),
        columnSpacing: 0,
        columns: [
          DataColumn(
            label: Text(
              S.of(context).item,
              style: AppStyles.styleRegular12(
                context,
              ).copyWith(color: Colors.black54),
            ),
          ),
          DataColumn(
            label: Text(
              S.of(context).quantity,
              style: AppStyles.styleRegular12(
                context,
              ).copyWith(color: Colors.black54),
            ),
          ),
          DataColumn(
            label: FittedBox(
              child: Text(
                S.of(context).price,
                style: AppStyles.styleRegular12(
                  context,
                ).copyWith(color: Colors.black54),
              ),
            ),
          ),
          DataColumn(
            label: Text(
              S.of(context).total,
              style: AppStyles.styleRegular12(
                context,
              ).copyWith(color: Colors.black54),
            ),
          ),
          DataColumn(label: Text('')),
        ],
        rows: [
          ...productItems.asMap().entries.map((entry) {
            final int index = entry.key;
            final ProductModel item = entry.value;
            return DataRow(
              cells: [
                DataCell(
                  FormBuilderDropdown<ProductModel>(
                    name: 'project_type',
                    decoration: InputDecoration(
                      fillColor: Color(0xFFEEF0F2),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                    items: cubit.products
                        .map(
                          (item) => DropdownMenuItem(
                            value: item,
                            child: Text(item.prodactName),
                          ),
                        )
                        .toList(),
                    onChanged: (product) {
                      if (product != null) {
                        cubit.updateProduct(index, product);
                      }
                    },
                    validator: FormBuilderValidators.required(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'quantity_$index',
                    initialValue: item.quantity.toString(),
                    onChanged: (value) {
                      if (value != null && int.tryParse(value) != null) {
                        cubit.updateQuantity(index, int.parse(value));
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      // fillColor: Color.fromARGB(255, 58, 98, 139),
                      // filled: true,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),

                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                    ]),
                  ),
                ),
                DataCell(
                  Text(
                    "\$${(item.unitPrice).toStringAsFixed(2)}",
                    style: AppStyles.styleRegular14(
                      context,
                    ).copyWith(color: Colors.black),
                  ),
                ),
                DataCell(
                  Text(
                    '\$${(item.quantity * item.unitPrice).toStringAsFixed(2)}',
                    style: AppStyles.styleRegular14(
                      context,
                    ).copyWith(color: Colors.black),
                  ),
                ),
                DataCell(
                  SizedBox(
                    child: Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          constraints: BoxConstraints(),
                          onPressed: () {
                            cubit.removeItem(index);
                          },
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          constraints: BoxConstraints(),
                          onPressed: () {
                            cubit.duplicateItem(index);
                          },
                          icon: const Icon(Icons.copy, size: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
