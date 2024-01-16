import 'dart:convert';
import 'dart:io';

import 'package:restic/apiHotelNew/model/booking.dart';

class BookingConvert{
    final client = HttpClient();

  Future<Booking> getPosts() async {
    final url = Uri.parse('https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff');
    final request = await client.getUrl(url);
    final response = await request.close();
    final string = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join());
    final json = jsonDecode(string) as Map<String, dynamic>;
    final post = Booking.fromJson(json);
    return post;
  }
}