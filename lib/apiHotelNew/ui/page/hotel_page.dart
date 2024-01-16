import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restic/apiHotelNew/model/formater.dart';
import '../../manager/hotel/cubit.dart';
import '../../manager/hotel/state.dart';
import '../../theme/theme.dart';
import '../widgets.dart';

class HotelPage extends StatelessWidget {
  const HotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => CubitHotel(),
      child: const Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeaderWidget(),
                BaseData(),
                SizedBox(height: 8),
                DetailData(),
                SizedBox(height: 12),
                ButtonNavigate(),
              ],
            ),
          )
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: double.infinity,
        child: const Text('Отель',style: pageTitle,textAlign: TextAlign.center),
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
      child: ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/room'), child: const Text('К выбору номера', style: buttonTextWhite)),
    );
  }
}

class BaseData extends StatelessWidget {
  const BaseData({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CubitHotel, StateHotel>(
      builder:(context, state) => state.isConnect ? Container(
        padding: const EdgeInsets.all(16),
        decoration: decorBorderRadiusButtom,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SliderImage(state.hotelConvert!.imageUrl),
            const SizedBox(height: 16),
            Rating('${state.hotelConvert!.rating} ${state.hotelConvert!.ratingName}'),
            const SizedBox(height: 8),
            Text(state.hotelConvert!.name, style: titleBloc),
            const SizedBox(height: 8),
            LinkTextWidget(state.hotelConvert!.adress),
            const SizedBox(height: 16),
            RichTextPrice(price: 'от ${Formatter(number: state.hotelConvert!.minPrice).formatTo()} ₽', text: ' за тур с перелетом'),
          ],
        ),
      ) : const CircularProgressIndicator(),
    );
  }
}


class DetailData extends StatelessWidget {
  const DetailData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitHotel, StateHotel>(
      builder:(context, state) => state.isConnect ? Container(
        padding: const EdgeInsets.all(16),
        decoration: decorBorderRadius,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              const Text('Об отеле', style: titleBloc),
              const SizedBox(height: 16),
              ListInfoHotel(state.hotelConvert!.aboutHotel.peculiarities),
              const SizedBox(height: 12),
              Text(state.hotelConvert!.aboutHotel.description, style: inputText),
              const SizedBox(height: 16),
              const ListButton(),
              
          ],
        ),
      ) : Container(),
    );
  }
}