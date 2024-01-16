import 'dart:convert';
import 'dart:io';

import 'package:restic/apiHotelNew/model/hotel.dart';

class HotelConvert{
    final client = HttpClient();

  Future<Hotel> getPosts() async {
    final url = Uri.parse('https://run.mocky.io/v3/75000507-da9a-43f8-a618-df698ea7176d');
    final request = await client.getUrl(url);
    final response = await request.close();
    final string = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join());
    final json = jsonDecode(string) as Map<String, dynamic>;
    final post = Hotel.fromJson(json);
    return post;
  }
}

/*
class ApiHotel{
  Future<HotelConvert?> converterDataFromApi() async{
    final client = HttpClient();

    final url = Uri.parse('https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473');
    final request = await client.getUrl(url);
    final response = await request.close();

    late dynamic jsonStringResult;
    final jsons = await response.transform(utf8.decoder).toList().then((value) => value.join());
    jsonStringResult = jsonDecode(jsons);

     late final HotelConvert data;

    try {
      data = HotelConvert.fromJson(jsonStringResult);
    } catch (_) {
      return null;
    }

    return data;
  }
}
*/
