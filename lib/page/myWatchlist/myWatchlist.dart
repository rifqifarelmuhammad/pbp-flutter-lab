import 'package:counter_7/page/myWatchlist/detail_watchlist.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/util/fetch_watchlist.dart';

class MyWatchlistPage extends StatefulWidget{
  const MyWatchlistPage({super.key});

  State<MyWatchlistPage> createState() => _MyWatchlistPage();
}

class _MyWatchlistPage extends State<MyWatchlistPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Watch List'),
      ),
      drawer: buildDrawer(context),

      body: FutureBuilder(
          future: fetchWatchList(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            }else{
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Belum ada data yang ditambahkan",
                      style: TextStyle(fontSize: 20),
                      ),
                  ],
                );
              } else{
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                         side: BorderSide(color: snapshot.data![index].watched? Colors.blue:Colors.red, width: 2,),
                      ),

                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                        child: ListTile(
                          title: Text(
                            "${snapshot.data![index].title}",
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                          ),

                          trailing: Checkbox(
                            value: snapshot.data![index].watched,
                            onChanged: (bool? newValue) {
                              setState(() {
                                snapshot.data![index].watched = !snapshot.data![index].watched;
                              });
                            }
                          ),

                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                  DetailWatchList(
                                    watchList: snapshot.data![index],
                                  )
                              ),
                            );
                          }
                        ),
                      ),
                    )
                  ),
                );
              }
            }
          }
      )
    );
  }
}