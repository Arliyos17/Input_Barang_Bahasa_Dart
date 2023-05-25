import 'package:flutter/material.dart';

class PublikasiPage extends StatelessWidget {
  final String namaBarang;
  final String deskripsi;
  final String harga;
  final String jenisBarang;
  final bool pengirimanDalamKota;
  final bool menerimaRetur;
  final String namaMahasiswa;
  final String nimMahasiswa;

  PublikasiPage({
    required this.namaBarang,
    required this.deskripsi,
    required this.harga,
    required this.jenisBarang,
    required this.pengirimanDalamKota,
    required this.menerimaRetur,
    required this.namaMahasiswa,
    required this.nimMahasiswa,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Publikasi'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama barang: $namaBarang'),
            SizedBox(height: 16.0),
            Text('Deskripsi: $deskripsi'),
            SizedBox(height: 16.0),
            Text('Harga: $harga'),
            SizedBox(height: 16.0),
            Text('Jenis barang: $jenisBarang'),
            SizedBox(height: 16.0),
            Text('Pengiriman dalam kota saja: ${pengirimanDalamKota ? 'Ya' : 'Tidak'}'),
            SizedBox(height: 16.0),
            Text('Menerima retur: ${menerimaRetur ? 'Ya' : 'Tidak'}'),
            SizedBox(height: 16.0),
            Text('Dikerjakan oleh: $nimMahasiswa - $namaMahasiswa'),
          ],
        ),
      ),
    );
  }
}
