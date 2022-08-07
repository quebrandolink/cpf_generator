import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/cpf_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CPF Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoMonoTextTheme(),
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const CpfPage(),
    );
  }
}
