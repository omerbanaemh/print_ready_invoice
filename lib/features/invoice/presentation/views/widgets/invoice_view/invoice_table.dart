import 'package:flutter/material.dart';
import 'package:print_ready_invoice/features/invoice/domin/entities/product_entity.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/invoice_cubit/invoice_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/invoice_table_columns.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/invoice_table_rows.dart';

class InvoiceTable extends StatelessWidget {
  const InvoiceTable({super.key, required this.products, required this.cubit});

  final InvoiceCubit cubit;
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: PlutoGrid(
        key: ValueKey(products.hashCode),
        columns: buildInvoiceColumns(context: context, cubit: cubit),
        rows: buildRows(products),
        configuration: const PlutoGridConfiguration(
          columnSize: PlutoGridColumnSizeConfig(
            autoSizeMode: PlutoAutoSizeMode.scale,
          ),
        ),
    
        onChanged: (PlutoGridOnChangedEvent event) {
          final field = event.column.field;
          final index = event.rowIdx;
          final value = event.value;
    
          if (field == 'item') {
            cubit.updateProduct(index: index, productName: value);
          } else if (field == 'quantity') {
            final quantity = int.tryParse(value.toString());
            if (quantity != null) {
              cubit.updateProduct(index: index, quantity: quantity);
            }
          }
        },
      ),
    );
  }
}