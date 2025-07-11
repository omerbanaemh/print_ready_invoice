import 'package:flutter/material.dart';
import 'package:print_ready_invoice/core/utils/size_config.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/project_details.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: const ProjectDetails(),
    );
  }
}