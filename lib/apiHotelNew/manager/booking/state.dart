import 'package:flutter/material.dart';

import '../../model/booking.dart';
import '../../model/form_btn.dart';

class StateBooking {
    final Booking ?bookingConvert;
    final bool isConnect;
    final List<FormBtn> listFormBtn;
    final bool isCheck;
    final GlobalObjectKey<FormState> keysMain;
  StateBooking({
    this.bookingConvert,
    this.isConnect = false,
    this.listFormBtn = const [],
    this.isCheck = false,
    this.keysMain = const GlobalObjectKey(100)
  });



  StateBooking copyWith({
    Booking ?bookingConvert,
    bool? isConnect,
    List<FormBtn>? listFormBtn,
    bool? isCheck,
  }) {
    return StateBooking(
      bookingConvert: bookingConvert ?? this.bookingConvert,
      isConnect: isConnect ?? this.isConnect,
      listFormBtn: listFormBtn ?? this.listFormBtn,
      isCheck: isCheck ?? this.isCheck,
    );
  }
}
