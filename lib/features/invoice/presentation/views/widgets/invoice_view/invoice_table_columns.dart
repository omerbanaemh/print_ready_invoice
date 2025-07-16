// features/invoice/presentation/widgets/invoice_table_columns.dart

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/invoice_cubit/invoice_cubit.dart';
import 'package:print_ready_invoice/generated/l10n.dart';

List<PlutoColumn> buildInvoiceColumns({
  required BuildContext context,
  required InvoiceCubit cubit
}) {
  final productOptions = [
    'UI/UX Design Package',
    'Cloud Hosting (Annual)',
    'Support & Maintenance',
    'Custom Plugin Development',
  ];

  return [
      PlutoColumn(
        title: S.of(context).item,
        field: 'item',
        type: PlutoColumnType.select(productOptions),
        enableColumnDrag: false,
        enableEditingMode: true,
        enableContextMenu: false,
        enableAutoEditing: true,
        backgroundColor: Colors.grey[300],
      ),

      PlutoColumn(
        title: S.of(context).quantity,
        field: 'quantity',
        type: PlutoColumnType.number(),
        enableColumnDrag: false,
        enableEditingMode: true,
        enableContextMenu: false,
        enableAutoEditing: true,
        backgroundColor: Colors.grey[300],
      ),
      PlutoColumn(
        title: S.of(context).price,
        field: 'unitPrice',
        type: PlutoColumnType.text(),
        enableColumnDrag: false,
        enableEditingMode: false,
        enableContextMenu: false,
        readOnly: true,
        backgroundColor: Colors.grey[300],
      ),
      PlutoColumn(
        title: S.of(context).total,
        field: 'total',
        type: PlutoColumnType.text(),
        enableColumnDrag: false,
        enableEditingMode: false,
        enableContextMenu: false,
        readOnly: true,
        backgroundColor: Colors.grey[300],
      ),
      PlutoColumn(
        title: '',
        field: 'actions',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        enableColumnDrag: false,
        enableContextMenu: false,
        backgroundColor: Colors.grey[300],
        width: 120, 
        renderer: (rendererContext) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red, size: 18),
                onPressed: () {
                  final rowIdx = rendererContext.rowIdx;
                  cubit.deleteProduct(index: rowIdx);
                },
              ),
              IconButton(
                icon: const Icon(Icons.copy, color: Colors.blue, size: 18),
                onPressed: () {
                  final rowIdx = rendererContext.rowIdx;
                  cubit.duplicateProduct(index: rowIdx);
                },
              ),
            ],
          );
        },
      ),
    ];
}
