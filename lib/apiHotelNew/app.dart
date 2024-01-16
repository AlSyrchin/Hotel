import 'package:flutter/material.dart';
import 'package:restic/apiHotelNew/ui/page/booking_page.dart';
import 'package:restic/apiHotelNew/ui/page/hotel_page.dart';
import 'package:restic/apiHotelNew/ui/page/pay_page.dart';
import 'package:restic/apiHotelNew/ui/page/room_page.dart';
import 'package:restic/apiHotelNew/theme/theme.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: createTheme(),
      routes: {
        '/hotel':(BuildContext context) => const HotelPage(),
        '/room':(BuildContext context) => const RoomPage(),
        '/booking':(BuildContext context) => const BookingPage(),
        '/pay':(BuildContext context) => const PayPage(),
      },
      debugShowCheckedModeBanner: false,
      home: const HotelPage(),
    );
  }
}
