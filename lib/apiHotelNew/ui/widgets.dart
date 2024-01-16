import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restic/apiHotelNew/theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

/*
class SliderImage extends StatelessWidget {
  const SliderImage(this.imageList, {super.key});
  final List<String> imageList;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
            width: double.infinity,
            height: 257,
            child: PageView.builder(
              onPageChanged: (index) => context.read<CubitSlider>().setActivPage(index),
              pageSnapping: true,
              itemCount: imageList.length,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: ImageNet(imageList[index]),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              color: AppColors.white,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List<Widget>.generate(imageList.length, (index) => CircularContainer(index: index)),
              ),
            ),
          ))
      ]
    );
  }
}
*/

class SliderImage extends StatefulWidget {
  const SliderImage(this.imageList, {super.key});
  final List<String> imageList;
  @override
  State<SliderImage> createState() => _SliderImageState();
}

class _SliderImageState extends State<SliderImage> {

  int activPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
            width: double.infinity,
            height: 257,
            child: PageView.builder(
              onPageChanged: (index) {activPage = index; setState(() {});},
              pageSnapping: true,
              itemCount: widget.imageList.length,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: ImageNet(widget.imageList[index]),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              color: AppColors.white,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List<Widget>.generate(widget.imageList.length, (index) => CircularContainer(index: index, activ: activPage)),
              ),
            ),
          ))
      ]
    );
  }
}

class ImageNet extends StatelessWidget {
  const ImageNet(this.image, {super.key});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => const Center(
        child: Text('Error'),
      ),
    );
  }
}

class LinkTextWidget extends StatelessWidget {
  const LinkTextWidget(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){}, child: Text(text, style: linkText));
  }
}

class CircularContainer extends StatelessWidget {
  const CircularContainer({super.key,required this.index, required this.activ});

  final int activ;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(2.5),
        width: 7,
        height: 7,
        decoration: BoxDecoration(
            color: activ == index ? AppColors.black : AppColors.blackLite2,
            shape: BoxShape.circle),
      )
    ;
  }
}

class Rating extends StatelessWidget {
  const Rating(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: Container(
        color: AppColors.orandeFon,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(CupertinoIcons.star_fill, color: AppColors.orange, size: 15),
            const SizedBox(width: 2),
            Text(text, style: ratingText)
          ],
        ),
      ),
    );
  }
}

class ListInfoHotel extends StatelessWidget {
  const ListInfoHotel(this.listInformation, {super.key});
  final List<String> listInformation;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: listInformation.map((e) => InfoHotelContent(e)).toList(),
    );
  }
}

class InfoHotelContent extends StatelessWidget {
  const InfoHotelContent(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.greyFon,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Text(text, style: hedline1),
    );
  }
}

class RichTextPrice extends StatelessWidget {
  const RichTextPrice({super.key, required this.price, required this.text});

  final String price;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(text: price, style: priceText),
        TextSpan(text: text, style: subPriceText)
      ]),
    );
  }
}

class ListButton extends StatelessWidget {
  const ListButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: CupertinoListSection.insetGrouped(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        backgroundColor:  AppColors.greyFon,
        children: const [
          ButtonContent(text: 'Удобства', icon: 'assets/emoji-happy.svg'),
          ButtonContent(text: 'Что включено', icon: 'assets/tick-square.svg'),
          ButtonContent(text: 'Что не включено', icon: 'assets/close-square.svg'),
        ],
      ),
    );
  }
}

class ButtonContent extends StatelessWidget {
  const ButtonContent({super.key, required this.text, required this.icon});
  final String text;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      padding: const EdgeInsets.symmetric(vertical: 10),
        backgroundColor: AppColors.greyFon,
        title: Text(text, style: listTitle),
        subtitle: const Text('Самое необходимое', style: hedline3),
        leading: SvgPicture.asset(icon),
        trailing: const Icon(CupertinoIcons.chevron_forward),
        onTap: () {},
      );
  }
}
