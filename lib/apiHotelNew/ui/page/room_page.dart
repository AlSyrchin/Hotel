import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restic/apiHotelNew/manager/rooms/cubit.dart';
import 'package:restic/apiHotelNew/manager/rooms/state.dart';
import 'package:restic/apiHotelNew/model/formater.dart';
import 'package:restic/apiHotelNew/repository/local/data.dart';
import '../../model/room.dart';
import '../../theme/theme.dart';
import '../widgets.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitRooms(),
      child: Scaffold(
        appBar: AppBar(title: const Text(DateState.titleRooms)),
        body: const SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 8),
                ListRoomsWidget(),
              ],
            ),
          )
        ),
      ),
    );
  }
}

class ListRoomsWidget extends StatelessWidget {
  const ListRoomsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitRooms, StateRooms>(
      builder: (context, state) => state.isConnect ? ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => BlocRoom(state.roomsConvert!.rooms[index]), 
        separatorBuilder: (context, index) => const SizedBox(height: 8), 
        itemCount: state.roomsConvert!.rooms.length,
        ) : const Center(child:  CircularProgressIndicator()),
    );
  }
}

class BlocRoom extends StatelessWidget {
  const BlocRoom(this.room, {super.key});

  final Room room;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: decorBorderRadius,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SliderImage(room.imageUrls),
          const SizedBox(height: 8),
          Text(room.name, style: titleBloc),
          const SizedBox(height: 8),
          ListInfoHotel(room.peculiarities),
          const SizedBox(height: 8),
          const TextButtonWidget(),
          const SizedBox(height: 16),
          RichTextPrice(price: '${Formatter(number: room.price).formatTo()} ₽ ', text: room.pricePer.toLowerCase()),
          const SizedBox(height: 16),
          const ButtonWidget(),
        ],
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: double.maxFinite,
          child: ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/booking'), child: const Text('Выбрать номер', style: buttonTextWhite)),
    );
  }
}

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Подробнее о номере', style: buttonTextBlue),
            Icon(CupertinoIcons.chevron_forward, color: AppColors.blue)
          ],
          ),
        );
  }
}