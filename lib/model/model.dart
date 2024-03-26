import 'package:flutter/foundation.dart';
import 'package:quotes/model/quotesmodellist.dart';

class Quotesmodel
{
  String? quote;
  String? author;

  Quotesmodel({this.quote,this.author});

  factory Quotesmodel.FromQuotes(Map quotes)
  {
    return Quotesmodel(author: quotes['author'],quote: quotes['quote']);
  }


}