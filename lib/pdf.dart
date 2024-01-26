import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:share/share.dart';
import 'dart:io';

class YourPDFScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PDFViewer(),
      ),
    );
  }
}

class PDFViewer extends StatelessWidget {
  PDFViewer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bhagwat Gita'),
        actions: [
          IconButton(
            icon: const Icon(Icons.book),
            onPressed: () {
              // _sharePDF(context, pdfPath);
            },
          ),
        ],
      ),
      body: SfPdfViewer.asset(
        "assets/Bhagavad_Gita.pdf",
      ),
    );
  }

  // void _sharePDF(BuildContext context, String pdfPath) {
  //   final RenderBox box = context.findRenderObject() as RenderBox;
  //   Share.shareFiles([pdfPath],
  //       text: 'Check out this PDF!',
  //       sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  // }
}
