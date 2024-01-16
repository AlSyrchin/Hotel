import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/network/api/api_booking.dart';
import '../../maskText/mask_text_input_formatter.dart';
import '../../model/booking.dart';
import '../../model/form_btn.dart';
import '../../repository/local/data.dart';
import 'state.dart';

class CubitBooking extends Cubit<StateBooking> {
  final apiBooking = BookingConvert();
  late Booking ?booking;
  
  CubitBooking() : super(StateBooking()){
    emit(state.copyWith(listFormBtn: [FormBtn(id: 0, name: 'Первый', isExpanded: false, key: const GlobalObjectKey(0))]));
    loadHotelData();
  }

  Future <void> loadHotelData() async {
    booking = await apiBooking.getPosts();
    if (booking == null) {emit(state.copyWith(isConnect: false));}
    else {emit(state.copyWith(isConnect: true, bookingConvert: booking));}
  }

  List<String> getListParam(){
    final params = state.bookingConvert!;
    final list = [params.departure, params.arrivalCountry, '${params.tourDateStart} - ${params.tourDateStop}', '${params.numberNights} ночей', params.hotelName, params.room, params.nutrition];
    return list; 
  }

  List<int> getListPrice(){
    final params = state.bookingConvert!;
    final List<int> list = [params.tourPrice, params.fuelCharge, params.serviceCharge, params.tourPrice + params.fuelCharge + params.serviceCharge];
    return list;
  }

    int getPriceBtn(){
    final params = state.bookingConvert!;
    return params.tourPrice + params.fuelCharge + params.serviceCharge;
  }

  void addListClient(){
    final nextItem = state.listFormBtn.length;
    if (DateState.clientList.length > nextItem){
    List<FormBtn> list = state.listFormBtn;
    list.add(FormBtn(id: nextItem, name: DateState.clientList[nextItem - 1], isExpanded: false, key: GlobalObjectKey(nextItem)));
    emit(state.copyWith(listFormBtn: list));
    }
  }

  void toggleExpanded(int index){
    List<FormBtn> list = state.listFormBtn;
    list[index].isExpanded = !list[index].isExpanded;
    emit(state.copyWith(listFormBtn: list));
  }

    String? getValid(String name ,String? text) {
    final regExpEmail = RegExp(r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)');
    final regExpPhon = RegExp(r'(^[+][7]..\d{3}..\d{3}.\d{2}.\d{2}$)');
    if (text!.isEmpty) return 'Пустое значение';
    if (name == 'Почта' && !regExpEmail.hasMatch(text)) return 'Некорректная почта';
    if (name == 'Номер телефона' && !regExpPhon.hasMatch(text)) return 'Некорректный номер телефона';
    return null;
  }

    MaskTextInputFormatter getMask(String name){
    if (name == 'Номер телефона') return   MaskTextInputFormatter(mask: '+7 (###) ###-##-##',filter: { "#": RegExp(r'[0-9]') }, type: MaskAutoCompletionType.lazy);
    if (name == DateState.textInputList[2] || name == DateState.textInputList[5])  return  MaskTextInputFormatter(mask: '##.##.####', filter: { "#": RegExp(r'[0-9]') }, type: MaskAutoCompletionType.lazy);
    return MaskTextInputFormatter();
  }

  bool validateForms(){
    bool result = true;
    bool keys;
    final keyMain = state.keysMain.currentState!.validate();
    for (var element in state.listFormBtn) {
      if (element.key.currentState == null) {keys = false;} else {keys = element.key.currentState!.validate();}
      result =  result && keys && keyMain;
    }
    emit(state.copyWith(isCheck: state.isCheck || !(result &&  keyMain)));
    return result;
  }

  void onTapOutsideBtn(bool isOnly){
    emit(state.copyWith(isCheck: isOnly));
  }
}

