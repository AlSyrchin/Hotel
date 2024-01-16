import 'package:flutter/material.dart';
import 'package:restic/apiHotelNew/model/randomize.dart';
import 'package:restic/apiHotelNew/repository/local/data.dart';
import 'package:restic/apiHotelNew/theme/theme.dart';

class PayPage extends StatelessWidget {
  const PayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(title: const Text(DateState.titlePay)),
      body:  const SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContentPay(),
            Spacer(),
            ButtonNavigate()
          ],
        )
      ),
    );
  }
}

class ContentPay extends StatelessWidget {
  const ContentPay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(23),
      child: Column(
        children: [
          const SizedBox(height: 122),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              padding: const EdgeInsets.all(25),
              color: AppColors.greyFon,
              child: Image.asset('assets/party_popper.png'),
            ),
          ),
          const SizedBox(height: 20),
          const Text(DateState.headerPay, style: titleBloc),
          const SizedBox(height: 20),
          Text('${DateState.textPay1}${Randomize(number: 1000000).getNumber()}${DateState.textPay2}', style: subPriceText, textAlign: TextAlign.center,),
        ],
      ),
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
      child: ElevatedButton(onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/hotel', (route) => false), child: const Text('Супер!', style: buttonTextWhite)),
    );
  }
}