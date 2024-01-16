import '../../model/hotel.dart';

class StateHotel {
    final Hotel ?hotelConvert;
    final bool isConnect;
  StateHotel({
    this.hotelConvert,
    this.isConnect = false,
  });

  StateHotel copyWith({
    Hotel? hotelConvert,
    bool? isConnect,
  }) {
    return StateHotel(
      hotelConvert: hotelConvert ?? this.hotelConvert,
      isConnect: isConnect ?? this.isConnect,
    );
  }
}
