    import 'package:pluto_grid/pluto_grid.dart';
import 'package:print_ready_invoice/features/invoice/domin/entities/product_entity.dart';

List<PlutoRow> buildRows(List<ProductEntity> products) {
      return products.asMap().entries.map((entry) {
        final p = entry.value;
        return PlutoRow(
          cells: {
            'item': PlutoCell(value: p.prodactName),
            'quantity': PlutoCell(value: p.quantity),
            'unitPrice': PlutoCell(value: '\$ ${p.unitPrice}'),
            'total': PlutoCell(value: '\$ ${p.total()}'),
            'actions': PlutoCell(value: ''),
          },
        );
      }).toList();
    }