import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:hive/hive.dart';

Future<void> createExcel() async {
  final Workbook workbook = Workbook();
  final Worksheet sheet = workbook.worksheets[0];
  final Style style = workbook.styles.add('Style1');
  final _mybox = Hive.box('mybox');
  var searchTerms = _mybox.keys.toList();

  try {
    int row = 1;
    for (int i = 0; i < 8; i++) {
      final kk = _mybox.get(searchTerms[i]);

      var color = Color(kk['color']).toString();
      var color_exel = color.substring(10, color.length - 1);

      style.backColor = '#$color_exel';
      sheet.getRangeByName('A$row').cellStyle = style;

      sheet.getRangeByName('B$row').setText(searchTerms[i]);
      //   sheet.getRangeByName('B$row').setText(kk["createdDate"]);
      sheet.getRangeByName('C$row').setText(kk["age"]);
      sheet.getRangeByName('D$row').setText(kk["phonenumber"]);
      sheet.getRangeByName('E$row').setText(kk["height"]);
      sheet.getRangeByName('F$row').setText(kk["weight"]);
      sheet.getRangeByName('G$row').setText(kk["bodymass"]);
      sheet.getRangeByName('H$row').setText(kk["pressure"]);
      sheet.getRangeByName('I$row').setText(kk["blood"]);
      sheet.getRangeByName('J$row').setText(kk["disease"]);
      sheet.getRangeByName('K$row').setText(kk["medicine"]);

      print("***************************************");

      print(Color(kk['color']));
      row++;
    }
  } catch (e) {
    print("***************************************");
    print(e);
  }
  ;

  print("object");

  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();

  final String path = (await getApplicationSupportDirectory()).path;
  final String fileName = '$path/Output.xlsx';
  final File file = File(fileName);
  await file.writeAsBytes(bytes, flush: true);
  OpenFile.open(fileName);
}
