import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restic/apiHotelNew/repository/network/api/api_hotel.dart';
import '../../model/hotel.dart';
import 'state.dart';

class CubitHotel extends Cubit<StateHotel> {
  final apiHotel = HotelConvert();
  late Hotel ?hotel;
  
  CubitHotel() : super(StateHotel()){loadHotelData();}

  Future <void> loadHotelData() async {
    hotel = await apiHotel.getPosts();
    if (hotel == null) {emit(state.copyWith(isConnect: false));}
    else {emit(state.copyWith(isConnect: true, hotelConvert: hotel));}
  }

}