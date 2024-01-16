part of 'theme.dart';

ThemeData createTheme() {
  return ThemeData(
        platform: TargetPlatform.iOS,
        scaffoldBackgroundColor: AppColors.colorPage,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white, 
          titleTextStyle: pageTitle,
          iconTheme: IconThemeData(color: AppColors.black),
          elevation: 0,
          ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: AppColors.white2,
          isDense: true,
          border: InputBorder.none,
          labelStyle: labelText,
        ),
        listTileTheme: const ListTileThemeData(
          dense: true,
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          contentPadding: EdgeInsets.all(0),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          )
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 0)),
            backgroundColor: MaterialStateProperty.all<Color>(AppColors.blueFon)
          )
        ),
        
        );
}