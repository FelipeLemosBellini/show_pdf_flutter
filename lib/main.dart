import 'package:advance_pdf_viewer2/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
        home: const ShowPdfPage(path: 'assets/ebook.pdf'));
  }
}

class ShowPdfPage extends StatefulWidget {
  final String path;

  const ShowPdfPage({required this.path, Key? key}) : super(key: key);

  @override
  State<ShowPdfPage> createState() => _ShowPdfPageState();
}

class _ShowPdfPageState extends State<ShowPdfPage> {
  late PDFDocument document;

  @override
  void initState() {
    loading();
    super.initState();
  }

  void loading() async {
    document = await PDFDocument.fromAsset(widget.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Visibility(
      visible: document != null,
      child: PDFViewer(
        document: document,
        zoomSteps: 1,

      ),
    ));
  }
}
