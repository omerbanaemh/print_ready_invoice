import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';
import 'package:print_ready_invoice/features/invoice/domin/entities/product_entity.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/invoice_cubit/invoice_cubit.dart';
import 'package:print_ready_invoice/generated/l10n.dart';

class InvoiceTable extends StatelessWidget {
  const InvoiceTable({
    super.key, required this.products, required this.cubit,
  });

  final InvoiceCubit cubit;
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
      final List<String> pro = [
    'UI/UX Design Package',
    'Cloud Hosting (Annual)',
    'Support & Maintenance',
    'Custom Plugin Development',
  ];
    return FormBuilder(
      child: DataTable(
        dataRowMaxHeight: 55,
        headingRowColor: WidgetStateProperty.all(const Color(0xFFEDEFF2)),
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
          const DataColumn(label: Text('')),
        ],
        rows: [
          ...products.asMap().entries.map((entry) {
            final int index = entry.key;
            final ProductEntity item = entry.value;
            return DataRow(
              cells: [
                DataCell(
                  FormBuilderDropdown<String>(
                    initialValue: item.prodactName,
                    name: 'project_type_$index',
                    decoration: const InputDecoration(
                      hintText: 'Select Product...',
                      fillColor: Color(0xFFEEF0F2),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                    items: pro
                        .map(
                          (item) => DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          ),
                        )
                        .toList(),
                    onChanged: (product) {
                      if (product != null) {
                        cubit.updateProduct(index: index, productName: product);
                      }
                    },
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'quantity_$index',
                    initialValue: item.quantity.toString(),
                    onChanged: (value) {
                      final int? quantity = int.tryParse(value ?? '');
                      if (quantity != null) {
                        cubit.updateProduct(index: index, quantity: quantity);
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    '\$${(item.unitPrice).toStringAsFixed(2)}',
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
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            // cubit.removeItem(index);
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
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            // cubit.duplicateItem(index);
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
