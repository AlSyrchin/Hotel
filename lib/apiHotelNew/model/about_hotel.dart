import 'package:json_annotation/json_annotation.dart';
part 'about_hotel.g.dart';

@JsonSerializable()
class AboutHotel {
  String description;
  List<String> peculiarities;
  AboutHotel({
    required this.description,
    required this.peculiarities,
  });

  factory AboutHotel.fromJson(dynamic json) => _$AboutHotelFromJson(json);
}
