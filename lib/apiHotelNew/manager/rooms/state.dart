import '../../model/rooms.dart';

class StateRooms {
    final Rooms ?roomsConvert;
    final bool isConnect;
  StateRooms({
    this.roomsConvert,
    this.isConnect = false,
  });

  StateRooms copyWith({
    Rooms? roomsConvert,
    bool? isConnect,
  }) {
    return StateRooms(
      roomsConvert: roomsConvert ?? this.roomsConvert,
      isConnect: isConnect ?? this.isConnect,
    );
  }
}
