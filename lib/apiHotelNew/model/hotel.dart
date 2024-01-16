import 'package:json_annotation/json_annotation.dart';
import 'about_hotel.dart';
part 'hotel.g.dart';

@JsonSerializable()
class Hotel {
  int id;
  String name;
  String adress;
  int minPrice;
  String priceForIt;
  int rating;
  String ratingName;
  List<String> imageUrl;
  AboutHotel aboutHotel;
  Hotel({
    required this.id,
    required this.name,
    required this.adress,
    required this.minPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrl,
    required this.aboutHotel,
  });

  factory Hotel.fromJson(dynamic json) => _$HotelFromJson(json);
}
