import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/model/budget.dart';
import 'package:counter_7/page/budget/show_list_budget.dart';
import 'package:counter_7/page/drawer.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _clearJudul = TextEditingController();
  final _clearNominal = TextEditingController();
  String _judul = "";
  int? _nominal = 0;
  List<String> listJenis = ['Pemasukan', 'Pengeluaran'];
  String? _jenis;
  DateTime? _dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Budget'),
      ),

      drawer: buildDrawer(context),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Contoh: Beli Sate Pacil",
                        labelText: "Judul",
                        icon: const Icon(Icons.add_circle),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),

                      controller: _clearJudul,

                      onChanged: (String? value) {
                        setState(() {
                          _judul = value!;
                        });
                      },

                      onSaved: (String? value) {
                        setState(() {
                          _judul = value!;
                        });
                      },

                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Judul tidak boleh kosong!';
                        }
                        return null;
                      }
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    TextFormField(
                        decoration: InputDecoration(
                            hintText: "Contoh: 15000",
                            labelText: "Nominal",
                            // Menambahkan icon agar lebih intuitif
                            icon: const Icon(Icons.monetization_on),
                            // Menambahkan circular border agar lebih rapi
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                            ),
                        ),

                        controller: _clearNominal,
                        // Menambahkan behavior saat nama diketik 
                        onChanged: (String? value) {
                            setState(() {
                                _nominal = int.tryParse(value!);
                            });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                            setState(() {
                                _nominal = int.tryParse(value!);
                            });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                                return 'Nominal tidak boleh kosong!';
                            }else if (_nominal == null){
                              return 'Nominal harus berupa angka!';
                            }
                            return null;
                        },
                    )
                  ]
                )
              ),

              const SizedBox(
                height: 10,
              ),

              SizedBox(
                width: 120,
                child: DropdownButtonFormField(
                  hint: const Text('Pilih Jenis'),
                  value: _jenis,
                  validator: (value) => 
                    value == null? "Pilih Jenis":null,
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                      value: 'Pengeluaran',
                      child: Text('Pengeluaran'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Pemasukan',
                      child: Text('Pemasukan'),
                    ),
                  ],
                  onChanged: (String? value){
                    setState(() {
                      _jenis = value!;
                    });
                  },
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              TextButton(
                child: Text(_dateTime == null ? "Pick a date" : "${_dateTime!.day}/${_dateTime!.month}/${_dateTime!.year}"),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2099),
                  ).then((date) {
                        //tambahkan setState dan panggil variabel _dateTime.
                    setState(() {
                      _dateTime = date;
                    });
                  });
                },
              ),

              const Spacer(),

              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  child: const Text("Simpan", style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: (){
                    if (_formKey.currentState!.validate() && _dateTime != null){
                      ListBudget.listdata.add(Budget(_judul, _nominal, _jenis, _dateTime!));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Text("Data berhasil ditambahkan!"),
                          action: SnackBarAction(
                            label: 'Close',
                            textColor: Colors.white,
                            onPressed: (){
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            },
                          ),
                        )
                      );
                      _clearJudul.clear();
                      _clearNominal.clear();

                      setState(() {
                        _jenis = null;
                        _dateTime = null;
                      });
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("Mohon isi data dengan lengkap!"),
                          action: SnackBarAction(
                            label: 'Close',
                            textColor: Colors.white,
                            onPressed: (){
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            },
                          ),
                        )
                      );
                    }
                  },
                ),
              ),
            ],
          )
        )
      ),
    );
  }
}