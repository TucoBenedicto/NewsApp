import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xml2json/xml2json.dart';
import 'package:http/http.dart' as http;



Future<List> rssToJson(String category, {String baseUrl = 'https://www.hindustantimes.com/feeds/rss/'}) async {
  var client = http.Client();
  final myTranformer = Xml2Json();
  var response = await client.get(Uri.parse(baseUrl + category +  '/rssfeed.xml'));
  myTranformer.parse(response.body);
  var json = myTranformer.toGData();
  var result = jsonDecode(json)['rss']['channel']['item'];
  /*
  "is"	True if the object has the specified type
  "is!"	True if the object doesn’t have the specified type
   */
  // if (!(result is List<dynamic>)) {
  if (result is! List<dynamic>) {
    return [result]; //return array (list)
  }
  return result;
}


//Figaro
/*
Future<List> rssToJson(String category, {String baseUrl = 'https://www.lefigaro.fr/rss/'}) async {
  var client = http.Client();
  final myTranformer = Xml2Json();
  var response = await client.get(Uri.parse(baseUrl + category +  '.xml'));
  myTranformer.parse(response.body);
  var json = myTranformer.toGData();
  var result = jsonDecode(json)['rss']['channel']['item'];
  /*
  is	True if the object has the specified type
  is!	True if the object doesn’t have the specified type
   */
  // if (!(result is List<dynamic>)) {
  if (result is! List<dynamic>) {
    return [result]; //return array (list)
  }
  return result;
}
 */
