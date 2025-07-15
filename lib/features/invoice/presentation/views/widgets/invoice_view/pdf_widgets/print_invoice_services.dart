  import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:print_ready_invoice/features/invoice/domin/entities/product_entity.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/pdf_widgets/pdf_widgets.dart';
import 'package:printing/printing.dart';

Future<void> printInvoice(
    List<ProductEntity> invoiceItems,
    double subtotal,
    double tax,
    double total,
  ) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (context) {
          return buildInvoiceBody(
            header: buildInvoiceHeader(),
            infoSection: buildInvoiceInfoSection(),
            table: buildInvoiceTable(invoiceItems),
            summary: buildInvoiceSummary(
              subtotal: subtotal,
              tax: tax,
              total: total,
            ),
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }