import 'package:flutter/material.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/budget.dart';
import 'package:counter_7/drawer.dart';

class ShowBudgetPage extends StatefulWidget {
  const ShowBudgetPage({super.key});

  final String title = 'Program Counter';

  @override
  State<ShowBudgetPage> createState() => _ShowBudgetPage();
}

class _ShowBudgetPage extends State<ShowBudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Budget'),
      ),
      drawer: buildDrawer(context),
      
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: ListBudget.listdata.isNotEmpty?
            ListBudget.listdata.map((item) => Container(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: SizedBox(
                  height: 100,
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text(
                            item.judul,
                            style: const TextStyle(
                              fontSize: 25 
                            ),
                          ),
                          Text(
                            item.jenis.toString(),
                            style: const TextStyle(
                              fontSize: 15 
                            ),
                          )
                          ],
                        ),

                        const Spacer(),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.nominal.toString(),
                              style: const TextStyle(
                                fontSize: 15 
                              ),
                            ),
                            Text(
                              "${item.dateTime.day}/${item.dateTime.month}/${item.dateTime.year}",
                              style: const TextStyle(
                                fontSize: 15 
                              ),
                            )
                          ],
                        )
                      ]
                    )
                  )
                )
              )
            )).toList()
            : [Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          "Belum ada data yang ditambahkan",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )]
          ),
        ),
      )
      
      
    );
  }
}