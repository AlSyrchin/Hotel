import 'dart:convert';
import 'dart:io';

import '../../../model/rooms.dart';


class RoomConvert{
    final client = HttpClient();

  Future<Rooms> getPosts() async {
    final url = Uri.parse('https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195');
    final request = await client.getUrl(url);
    final response = await request.close();
    final string = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join());
    final json = jsonDecode(string) as Map<String, dynamic>;
    final post = Rooms.fromJson(json);
    return post;
  }
}
