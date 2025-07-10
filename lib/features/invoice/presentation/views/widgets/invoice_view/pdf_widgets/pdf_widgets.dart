import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:print_ready_invoice/features/invoice/models/product_model.dart';

pw.Widget buildInvoiceHeader() {
  return pw.Container(
    padding: const pw.EdgeInsets.all(20),
    decoration: pw.BoxDecoration(
      color: PdfColor.fromInt(0xFFE3F2FD), // Blue[50]
      border: pw.Border.all(color: PdfColor.fromInt(0xFFD6D8DB)),
      borderRadius: const pw.BorderRadius.only(
        topLeft: pw.Radius.circular(12),
        topRight: pw.Radius.circular(12),
      ),
    ),
    child: pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Expanded(
          child: pw.Row(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                decoration: pw.BoxDecoration(
                  color: PdfColor.fromInt(0xFFD6D6D6),
                  borderRadius: pw.BorderRadius.circular(8),
                ),
                child: pw.Text(
                  '150 * 50',
                  style: pw.TextStyle(
                    fontSize: 14,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColor.fromInt(0xFF9E9E9E),
                  ),
                ),
              ),
              pw.SizedBox(width: 10),
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Onyx IX Solutions',
                      style: pw.TextStyle(
                        fontSize: 14,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColor.fromInt(0xFF2196F3), // blue
                      ),
                    ),
                    pw.Text(
                      '123 Innovation Drive, Tech City, 12345',
                      style: pw.TextStyle(
                        fontSize: 12,
                        color: PdfColor.fromInt(0xFF757575), // black54
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Text(
              'INVOICE',
              style: pw.TextStyle(
                fontSize: 20,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Text(
              'INV-2024-001',
              style: pw.TextStyle(fontSize: 12),
            ),
            pw.Text(
              'Date: 7-7-2025',
              style: pw.TextStyle(fontSize: 12),
            ),
          ],
        ),
      ],
    ),
  );
}




pw.Widget buildInvoiceInfoSection() {
  return pw.Row(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      // Bill To Section
      pw.Expanded(
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Bill To:', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            pw.Text('Global Corp', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: PdfColors.blue)),
            pw.Text('456 Business Avenue, Metroplis, 67890', style: pw.TextStyle(fontSize: 10, color: PdfColors.grey700)),
            pw.Text('contact@gmail.com', style: pw.TextStyle(fontSize: 10, color: PdfColors.grey700)),
          ],
        ),
      ),

      // Project Details Section
      pw.Expanded(
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Project Details', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            _richText('Name: ', 'omar'),
            _richText('Type: ', 'osvdvbfmar'),
            _richText('FrameWork: ', 'sd vsd'),
            _richText('Technologies: ', 'htbhfgb gbjbjhg'),
            _richText('Description: ', 'rrrrrrrrrrrrrrrrrrrrrrr'),
          ],
        ),
      ),
    ],
  );
}

// دالة صغيرة لعرض rich text داخل PDF
pw.Widget _richText(String label, String value) {
  return pw.RichText(
    text: pw.TextSpan(
      children: [
        pw.TextSpan(
          text: label,
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
        ),
        pw.TextSpan(
          text: value,
          style: pw.TextStyle(fontSize: 10),
        ),
      ],
    ),
  );
}



















pw.Widget buildInvoiceTable(List<ProductModel> items) {
  return pw.TableHelper.fromTextArray(
    border: pw.TableBorder.all(color: PdfColors.grey),
    cellAlignment: pw.Alignment.centerLeft,
    headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
    headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
    headers: ['Item', 'Quantity', 'Unit Price', 'Total'],
    data: items.map((item) {
      final total = item.quantity * item.unitPrice;
      return [
        item.prodactName,
        item.quantity.toString(),
        '\$${item.unitPrice.toStringAsFixed(2)}',
        '\$${total.toStringAsFixed(2)}',
      ];
    }).toList(),
  );
}













pw.Widget buildInvoiceSummary({
  required double subtotal,
  required double tax,
  required double total,
}) {
  return pw.Align(
    alignment: pw.Alignment.centerRight,
    child: pw.Container(
      width: 200,
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('Subtotal', style: pw.TextStyle(color: PdfColors.grey800)),
              pw.Text('\$${subtotal.toStringAsFixed(2)}', style: pw.TextStyle(color: PdfColors.black)),
            ],
          ),
          pw.SizedBox(height: 4),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('Tax (8%)', style: pw.TextStyle(color: PdfColors.grey800)),
              pw.Text('\$${tax.toStringAsFixed(2)}', style: pw.TextStyle(color: PdfColors.black)),
            ],
          ),
          pw.SizedBox(height: 10),
          pw.Divider(color: PdfColors.grey300),
          pw.Container(
            padding: const pw.EdgeInsets.all(8),
            decoration: pw.BoxDecoration(
              color: PdfColors.blue50,
              borderRadius: pw.BorderRadius.circular(4),
            ),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Grand Total', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text('\$${total.toStringAsFixed(2)}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}











pw.Widget buildInvoiceBody({
  required pw.Widget header,
  required pw.Widget infoSection,
  required pw.Widget table,
  required pw.Widget summary,
}) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      header,

      pw.Container(
        width: double.infinity,
        padding: const pw.EdgeInsets.all(20),
        decoration: pw.BoxDecoration(
          color: PdfColors.white,
          borderRadius: const pw.BorderRadius.only(
            bottomLeft: pw.Radius.circular(12),
            bottomRight: pw.Radius.circular(12),
          ),
          border: pw.Border.all(
            color: PdfColor.fromHex("#D6D8DB"),
            width: 1,
          ),
        ),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // معلومات الفاتورة (مثل InvoiceInfoSection)
            infoSection,
            pw.SizedBox(height: 20),

            // الجدول
            table,
            pw.SizedBox(height: 25),

            pw.Divider(color: PdfColors.grey300, thickness: 1),
            pw.SizedBox(height: 25),

            // الملخص
            summary,
          ],
        ),
      ),
      pw.SizedBox(height: 20),
    ],
  );
}




