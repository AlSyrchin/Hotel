part of 'theme.dart';

const pageTitle = TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.black);
const labelText = TextStyle(fontWeight: FontWeight.w400, fontSize: 17, color: AppColors.greyLite);
const ratingText = TextStyle(fontWeight: FontWeight.w500, fontSize: 16,  color: AppColors.orange);
const titleBloc = TextStyle(fontWeight: FontWeight.w500, fontSize: 22, color: AppColors.black);
const linkText = TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.blue);
const priceText = TextStyle(fontWeight: FontWeight.w600, fontSize: 30, color: AppColors.black);
const subPriceText = TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: AppColors.grey);
const lowerText = TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: AppColors.blackLite);
const hedline1 = TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.grey);
const buttonTextWhite = TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.white);
const buttonTextBlue = TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.blue);
const hedline2 = TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: AppColors.black);
const hedline3 = TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.grey);
const inputText = TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: AppColors.blueHide);
const textPriceSumm = TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: AppColors.blue);
const listTitle = TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.greyTitle);

const decorBorder = BoxDecoration(color: AppColors.white, border: Border(top: BorderSide(color: AppColors.colorBorder)));
const decorBorderRadius = BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.all(Radius.circular(12)));
const decorBorderRadiusButtom = BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)));

abstract class AppColors {
  static const  black = Colors.black;
  static const  white = Colors.white;
  static const  blackLite = Color.fromRGBO(0, 0, 0, 0.9);
  static const  blackLite2 = Color.fromRGBO(0, 0, 0, 0.22);
  static const  orange = Color.fromRGBO(255, 168, 0, 1);
  static const  orandeFon = Color.fromRGBO(255, 199, 0, 0.2);
  static const  grey = Color.fromRGBO(130, 135, 150, 1);
  static const  greyFon = Color.fromRGBO(251, 251, 252, 1);
  static const  greyTitle = Color.fromRGBO(44, 48, 53, 1);
  static const  blue = Color.fromRGBO(13, 114, 255, 1);
  static const  blueFon = Color.fromRGBO(13, 114, 255, 0.1);
  static const  white2 = Color.fromRGBO(246, 246, 249, 1);
  static const  greyLite = Color.fromRGBO(169, 171, 183, 1);
  static const  colorPage = Color.fromRGBO(246, 246, 249, 1);
  static const  blueHide = Color.fromRGBO(20, 20, 43, 1);
  static const  colorBorder = Color.fromRGBO(232, 233, 236, 1);
}