import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/network/api/api_room.dart';
import '../../model/rooms.dart';
import 'state.dart';

class CubitRooms extends Cubit<StateRooms> {
  final apiRooms = RoomConvert();
  late Rooms ?rooms;
  
  CubitRooms() : super(StateRooms()){loadHotelData();}

  Future <void> loadHotelData() async {
    rooms = await apiRooms.getPosts();
    if (rooms == null) {emit(state.copyWith(isConnect: false));}
    else {emit(state.copyWith(isConnect: true, roomsConvert: rooms));}
  }

}