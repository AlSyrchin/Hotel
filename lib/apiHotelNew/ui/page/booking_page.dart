import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restic/apiHotelNew/manager/booking/cubit.dart';
import 'package:restic/apiHotelNew/manager/booking/state.dart';
import 'package:restic/apiHotelNew/model/formater.dart';
import 'package:restic/apiHotelNew/repository/local/data.dart';
import '../../theme/theme.dart';
import '../widgets.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitBooking(),
      child: Scaffold(
        appBar: AppBar(title: const Text(DateState.titleBooking)),
        body: const SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 8),
              BlocHotelContent(),
              SizedBox(height: 8),
              BlocDataBooking(),
              SizedBox(height: 8),
              BlocInfoClient(),
              SizedBox(height: 8),
              PanelMenuInput(),
              PanelMenuAdd(),
              SizedBox(height: 8),
              BlocSumPrice(),
              SizedBox(height: 8),
              ButtonNavigate()
            ],
          ),
        )),
      ),
    );
  }
}

class BlocHotelContent extends StatelessWidget {
  const BlocHotelContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitBooking, StateBooking>(
      builder: (context, state) => state.isConnect
          ? Container(
              padding: const EdgeInsets.all(16),
              decoration: decorBorderRadius,
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Rating('${state.bookingConvert!.horating} ${state.bookingConvert!.ratingName}'),
                  const SizedBox(height: 8),
                  Text(state.bookingConvert!.hotelName, style: titleBloc),
                  const SizedBox(height: 8),
                  LinkTextWidget(state.bookingConvert!.hotelAdress),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

class BlocDataBooking extends StatelessWidget {
  const BlocDataBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitBooking, StateBooking>(
      builder: (context, state) => state.isConnect
          ? Container(
              padding: const EdgeInsets.all(16),
              decoration: decorBorderRadius,
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: DateState.infoBookingList.length,
                  itemBuilder: (context, index) => DataBookingElement(
                      name: DateState.infoBookingList[index],
                      text: context.read<CubitBooking>().getListParam()[index],
                    ),
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  ),
                )
          : Container(),
    );
  }
}

class DataBookingElement extends StatelessWidget {
  const DataBookingElement({super.key, required this.name, required this.text});

  final String name;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: subPriceText),
        SizedBox(width: 203, child: Text(text, style: hedline2)),
      ],
    );
  }
}

class BlocInfoClient extends StatelessWidget {
  const BlocInfoClient({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitBooking, StateBooking>(
      builder: (context, state) => Container(
        padding: const EdgeInsets.all(16),
        decoration: decorBorderRadius,
        child: Form(
          key: state.keysMain,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DateState.titleInfoClient, style: titleBloc),
              SizedBox(height: 20),
              TextInput('Номер телефона', isOnly: true),
              SizedBox(height: 8),
              TextInput('Почта', isOnly: true),
              SizedBox(height: 8),
              Text(DateState.dataInfoClient, style: hedline3),
            ],
          ),
        ),
      ),
    );
  }
}

class TextInput extends StatelessWidget {
  const TextInput(this.name, {super.key, required this.isOnly});

  final String name;
  final bool isOnly;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BlocBuilder<CubitBooking, StateBooking>(
        builder: (context, state) => TextFormField(
          autovalidateMode: state.isCheck ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
          inputFormatters: [context.read<CubitBooking>().getMask(name)],
          validator: (value) => context.read<CubitBooking>().getValid(name, value),
          style: inputText,
          decoration: InputDecoration(labelText: name),
          onTapOutside: (event) => context.read<CubitBooking>().onTapOutsideBtn(isOnly),
        ),
      ),
    );
  }
}

class PanelMenuInput extends StatelessWidget {
  const PanelMenuInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitBooking, StateBooking>(
      builder: (context, state) => Column(
        children: state.listFormBtn.map((e) => Column(
        children: [
          HeaderPanelMenuInput(name: e.name, index: e.id), 
          Visibility(visible: e.isExpanded, child: BodyPanelMenuInput(e.key)),
          const SizedBox(height: 8)
        ],
      )).toList(),
      )  ,
    );
  }
}

class HeaderPanelMenuInput extends StatelessWidget {
  const HeaderPanelMenuInput({super.key, required this.index, required this.name});

  final String name;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decorBorderRadius,//
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
      child: ListTile(
        title: Text('$name турист', style: titleBloc),
        trailing: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              width: 32,
              height: 32,
              color: AppColors.blueFon,
              child: IconButton(
                alignment: Alignment.center,
                onPressed: () => context.read<CubitBooking>().toggleExpanded(index),
                icon: BlocBuilder<CubitBooking, StateBooking>(
                  builder:(context, state) => Icon(state.listFormBtn[index].isExpanded ? CupertinoIcons.chevron_up : CupertinoIcons.chevron_down, color: AppColors.blue, size: 20),
                  ),
              ),
            )),
      ),
    );
  }
}

class BodyPanelMenuInput extends StatelessWidget {
  const BodyPanelMenuInput(this.keys, {super.key});
  final GlobalKey keys;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: keys,
      child: Container(
        decoration: decorBorderRadius,//
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => TextInput(DateState.textInputList[index], isOnly: false),
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemCount: DateState.textInputList.length),
      ),
    );
  }
}

class PanelMenuAdd extends StatelessWidget {
  const PanelMenuAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decorBorderRadius,
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
      child: ListTile(
        title: const Text('Добавить туриста', style: titleBloc),
        trailing: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              width: 32,
              height: 32,
              color: AppColors.blue,
              child: IconButton(
                alignment: Alignment.center,
                onPressed: () => context.read<CubitBooking>().addListClient(),
                icon: const Icon(CupertinoIcons.add, color: AppColors.white, size: 20),
              ),
            )),
      ),
    );
  }
}

class BlocSumPrice extends StatelessWidget {
  const BlocSumPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitBooking, StateBooking>(
      builder: (context, state) => state.isConnect ? Container(
        padding: const EdgeInsets.all(16),
        decoration: decorBorderRadius,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: DateState.infoPriceList.length,
          itemBuilder: (context, index) => ListTile(
            minVerticalPadding: 0, 
            title: Text(DateState.infoPriceList[index], style: subPriceText), 
            trailing: Text('${Formatter(number: context.read<CubitBooking>().getListPrice()[index]).formatTo()} ₽', style: (index == DateState.infoPriceList.length - 1) ? textPriceSumm : hedline2),
            ),
          ),
      ) : Container(),
    );
  }
}

class ButtonNavigate extends StatelessWidget {
  const ButtonNavigate({super.key});

  @override
  Widget build(BuildContext context) {   
    return Container(
      decoration: decorBorder,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: () => context.read<CubitBooking>().validateForms() ? Navigator.pushNamed(context, '/pay') : null, 
        child: BlocBuilder<CubitBooking, StateBooking>(builder: (context, state) =>  Text('Оплатить ${state.isConnect ? Formatter(number: context.read<CubitBooking>().getPriceBtn()).formatTo() : '0'} ₽', style: buttonTextWhite))
      ),
    );
  }
}