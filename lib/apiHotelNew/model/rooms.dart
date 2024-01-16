import 'package:json_annotation/json_annotation.dart';
import 'room.dart';
part 'rooms.g.dart';

@JsonSerializable()
class Rooms {
  List<Room> rooms;
  Rooms({
    required this.rooms,
  });

  factory Rooms.fromJson(dynamic json) => _$RoomsFromJson(json);
}
