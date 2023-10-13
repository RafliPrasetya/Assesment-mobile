import 'package:flutter/material.dart';
import 'package:pertama/ui/produk_form.dart'; // path file ProdukForm.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: ProdukForm(), // Memanggil class ProdukForm sebagai halaman utama
    );
  }
}
