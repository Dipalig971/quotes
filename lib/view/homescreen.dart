import 'dart:math';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:quotes/model/model.dart';
import 'package:quotes/model/quotesmodellist.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Quotesmodel? quotesmodel = Quotesmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QuotesApp'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          Random random=Random();
          randomnum=random.nextInt(quoteslist.length);
          showDialog(context: context, builder: (context) => AlertDialog(
            title: Text('Tip_of_the_day $randomnum'),
            content: Text(Quotesmodel.FromQuotes(quoteslist[randomnum]).quote!),
            actions: [
              TextButton(onPressed:() {
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Save succesfully')));
               Navigator.of(context).pop();
              },child:Text('Save') ),
              TextButton(onPressed:() {
                Navigator.of(context).pop();
              },child:Text('back') ),
            ],
          ),);
        }, child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            quoteslist.length,
            (index) => Card(
              child: ListTile(
                title: Text(Quotesmodel.FromQuotes(quoteslist[index]).quote!),
                subtitle: Text(
                  Quotesmodel.FromQuotes(quoteslist[index]).author!,
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
int randomnum=0;
