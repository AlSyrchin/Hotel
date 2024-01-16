// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';

class Formatter {
  final int number;
  Formatter({
    required this.number,
  });
  String formatTo(){
    final formRu = NumberFormat.decimalPattern('ru');
    return formRu.format(number);
  }
}
