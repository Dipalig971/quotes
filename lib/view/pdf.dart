import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pd;
import 'package:printing/printing.dart';

class Pdfscreen extends StatefulWidget {
  const Pdfscreen({super.key});

  @override
  State<Pdfscreen> createState() => _PdfscreenState();
}

class _PdfscreenState extends State<Pdfscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pdfpage'),
      ),
      body: Column(
        children: [
          Text('dipali'),
          ElevatedButton(
              onPressed: ()  async {
                 await Navigator.push(context, MaterialPageRoute(builder: (context) => Printing(),));
              },
              child: Center(child: Icon(Icons.picture_as_pdf)))
        ],
      ),
    );
  }
}

Future<Uint8List> genterepdf() async {
  final pdf = pd.Document();
  pdf.addPage(
    pd.Page(
      build: (context) {
        return pd.Center(
            child: pd.Text('Dipali gunjal',
                style: pd.TextStyle(
                    color: PdfColors.teal,
                    fontWeight: pd.FontWeight.bold,
                    fontSize: 25)));
      },
    ),
  );
  // await Printing.layoutPdf(
  //     onLayout: (PdfPageFormat format) async => pdf.save());
  PdfPreview(
    build: (format) => pdf.save(),
  );
  return pdf.save();
}

class Printing extends StatefulWidget {
  const Printing({super.key});

  @override
  State<Printing> createState() => _PrintingState();
}

class _PrintingState extends State<Printing> {
  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      build: (format) => genterepdf(),
    );
  }
}
