import 'package:d_input/d_input.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';

class AddHistoryPage extends StatelessWidget {
  const AddHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DView.appBarLeft("Tambah Baru"),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Tanggal',
              style: TextStyle(fontWeight: FontWeight.bold),
             ),
            Row(
              children: [
                const Text(
                  '2022-01-01',
                ),
                DView.spaceWidth(),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.event),
                  label: Text('Pilih'),
                ),
              ],
            ),
            DView.spaceHeight(),
            const Text(
              'Tipe',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DView.spaceHeight(4),
            DropdownButtonFormField(
              value: 'Pemasukan',
              items: ['Pemasukan', 'Pengeluaran'].map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
              onChanged: (value) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
            DView.spaceHeight(),
            DInput(
              controller: TextEditingController(),
              hint: 'Jualan',
              title: 'Sumber / Objek Pengeluaran',
            ),
            DView.spaceHeight(),
            DInput(
              controller: TextEditingController(),
              hint: '3000',
              title: 'Harga',
              inputType: TextInputType.number,
            )
          ],
        ));
  }
}
