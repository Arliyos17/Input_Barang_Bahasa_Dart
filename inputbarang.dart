import 'package:flutter/material.dart';
import 'package:assesment_2_6701213007/hal_dua.dart';

void main() {
  runApp(BarangScreen());
}

class BarangScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        '/publikasi': (context) => PublikasiPage(
          namaBarang: '',
          deskripsi: '',
          harga: '',
          jenisBarang: '',
          pengirimanDalamKota: false,
          menerimaRetur: false,
          namaMahasiswa: '',
          nimMahasiswa: '',
        ),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? _kondisiBarangValue;
  bool _pengirimanDalamKota = false;
  bool _menerimaRetur = false;

  String _namaBarang = '';
  String _deskripsi = '';
  String _harga = '';

  TextEditingController _namaBarangController = TextEditingController();
  TextEditingController _deskripsiController = TextEditingController();
  TextEditingController _hargaController = TextEditingController();

  @override
  void dispose() {
    _namaBarangController.dispose();
    _deskripsiController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Barang'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // View Pertama
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    controller: _namaBarangController,
                    decoration: InputDecoration(
                      labelText: 'Nama barang',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _namaBarang = value;
                      });
                    },
                  ),
                ),
              ),

              // View Kedua
              SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    controller: _deskripsiController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: 'Deskripsi',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _deskripsi = value;
                      });
                    },
                  ),
                ),
              ),

              // View Ketiga
              SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    controller: _hargaController,
                    decoration: InputDecoration(
                      labelText: 'Harga',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _harga = value;
                      });
                    },
                  ),
                ),
              ),

              // View Keempat (Kondisi barang)
              SizedBox(height: 16.0),
              Text(
                'Kondisi barang',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Radio<int>(
                        value: 1,
                        groupValue: _kondisiBarangValue,
                        onChanged: (value) {
                          setState(() {
                            _kondisiBarangValue = value;
                          });
                        },
                      ),
                      Text('Bekas'),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Radio<int>(
                        value: 2,
                        groupValue: _kondisiBarangValue,
                        onChanged: (value) {
                          setState(() {
                            _kondisiBarangValue = value;
                          });
                        },
                      ),
                      Text('Baru'),
                    ],
                  ),
                ],
              ),

              // View Kelima (Pengiriman dalam kota saja)
              SizedBox(height: 16.0),
              CheckboxListTile(
                value: _pengirimanDalamKota,
                onChanged: (value) {
                  setState(() {
                    _pengirimanDalamKota = value!;
                  });
                },
                title: Text('Pengiriman dalam kota saja'),
              ),

              // View Keenam (Menerima retur)
              SizedBox(height: 16.0),
              CheckboxListTile(
                value: _menerimaRetur,
                onChanged: (value) {
                  setState(() {
                    _menerimaRetur = value!;
                  });
                },
                title: Text('Menerima retur'),
              ),

              SizedBox(height: 16.0),

              // Tombol Publikasikan
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PublikasiPage(
                          namaBarang: _namaBarang,
                          deskripsi: _deskripsi,
                          harga: _harga,
                          jenisBarang: _kondisiBarangValue == 1 ? 'Bekas' : 'Baru',
                          pengirimanDalamKota: _pengirimanDalamKota,
                          menerimaRetur: _menerimaRetur,
                          namaMahasiswa: 'Arliyos',
                          nimMahasiswa: '6701213007',
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 64.0),
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(
                        color: Colors.blue,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Text(
                    'Publikasikan',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
