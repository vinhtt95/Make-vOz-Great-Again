import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  AppThemes._();

  static const Color dodgerBlue = Color.fromRGBO(29, 161, 242, 1);
  static const Color whiteLilac = Color.fromRGBO(248, 250, 252, 1);
  static const Color blackPearl = Color.fromRGBO(30, 31, 43, 1);
  static const Color brinkPink = Color.fromRGBO(255, 97, 136, 1);
  static const Color juneBud = Color.fromRGBO(186, 215, 97, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color nevada = Color.fromRGBO(105, 109, 119, 1);
  static const Color ebonyClay = Color.fromRGBO(40, 42, 58, 1);
  static const Color MVGA = Color.fromRGBO(236, 38, 33, 1);

  static String font1 = "ProductSans";
  static String font2 = "Roboto";

  //constants color range for light theme
  //main color
  static const Color _lightPrimaryColor = MVGA;

  //Background Colors
  static const Color _lightBackgroundColor = whiteLilac;
  static const Color _lightBackgroundAppBarColor = _lightPrimaryColor;
  static const Color _lightBackgroundSecondaryColor = white;
  static const Color _lightBackgroundAlertColor = blackPearl;
  static const Color _lightBackgroundActionTextColor = white;
  static const Color _lightBackgroundErrorColor = brinkPink;
  static const Color _lightBackgroundSuccessColor = juneBud;

  //Text Colors
  static const Color _lightTextColor = Colors.black;
  static const Color _lightAlertTextColor = Colors.black;
  static const Color _lightTextSecondaryColor = Colors.black;

  //Border Color
  static const Color _lightBorderColor = nevada;

  //Icon Color
  static const Color _lightIconColor = nevada;

  //form input colors
  static const Color _lightInputFillColor = _lightBackgroundSecondaryColor;
  static const Color _lightBorderActiveColor = _lightPrimaryColor;
  static const Color _lightBorderErrorColor = brinkPink;

  //constants color range for dark theme
  static const Color _darkPrimaryColor = MVGA;

  //Background Colors
  static const Color _darkBackgroundColor = ebonyClay;
  static const Color _darkBackgroundAppBarColor = _darkPrimaryColor;
  static const Color _darkBackgroundSecondaryColor =
      Color.fromRGBO(0, 0, 0, .6);
  static const Color _darkBackgroundAlertColor = blackPearl;
  static const Color _darkBackgroundActionTextColor = white;

  static const Color _darkBackgroundErrorColor =
      Color.fromRGBO(255, 97, 136, 1);
  static const Color _darkBackgroundSuccessColor =
      Color.fromRGBO(186, 215, 97, 1);

  //Text Colors
  static const Color _darkTextColor = Colors.white;
  static const Color _darkAlertTextColor = Colors.black;
  static const Color _darkTextSecondaryColor = Colors.black;

  //Border Color
  static const Color _darkBorderColor = nevada;

  //Icon Color
  static const Color _darkIconColor = white;

  static const Color _darkInputFillColor = _darkBackgroundSecondaryColor;
  static const Color _darkBorderActiveColor = _darkPrimaryColor;
  static const Color _darkBorderErrorColor = brinkPink;

  //text theme for light theme
  static final TextTheme _lightTextTheme = TextTheme(
    // * Extremely large text.
    headline1: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w600, color: _lightTextColor),
    // * Used for the date in the dialog shown by showDatePicker.
    headline2: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w500, color: _lightTextColor),
    // * Very large text.
    headline3: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w400, color: _lightTextColor),
    // * Large text.
    headline4: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w300, color: _lightTextColor),
    // * Used for large text in dialogs (e.g., the month and year in the dialog shown by showDatePicker).
    headline5: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w200, color: _lightTextColor),
    // * Used for the primary text in app bars and dialogs (e.g., AppBar.title and AlertDialog.title).
    headline6: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w800, color: white),
    // * Used for the primary text in lists (e.g., ListTile.title).
    subtitle1: GoogleFonts.lato(fontSize: 16.0, fontWeight: FontWeight.normal, color: _lightTextColor),
    // * For medium emphasis text that's a little smaller than subtitle1.
    subtitle2: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.normal, color: _lightTextColor),
    // * Used for emphasizing text that would otherwise be bodyText2.
    bodyText1: GoogleFonts.lato(fontSize: 16.0, color: _lightTextColor),
    // * The default text style for Material.
    bodyText2: GoogleFonts.lato(fontSize: 16.0, color: _lightTextColor),
    // * Used for auxiliary text associated with images.
    caption: GoogleFonts.lato(fontSize: 12.0, color: _lightBackgroundAppBarColor),
    // * Used for text on ElevatedButton, TextButton and OutlinedButton.
    button: GoogleFonts.lato(fontSize: 16.0, color: _lightTextColor, fontWeight: FontWeight.w600),
    // * Typically used for captions or to introduce a (larger) headline.
    overline: GoogleFonts.lato(fontSize: 16.0, color: _lightTextColor, fontWeight: FontWeight.w600),
  );

  //the light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: GoogleFonts.lato.toString(),
    scaffoldBackgroundColor: _lightBackgroundColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _lightPrimaryColor,
    ),
    appBarTheme: AppBarTheme(
      color: _lightBackgroundAppBarColor,
      iconTheme: IconThemeData(color: _lightTextColor),
      textTheme: _lightTextTheme,
    ),
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      primaryVariant: _lightBackgroundColor,
      // secondary: _lightSecondaryColor,
    ),
    snackBarTheme: SnackBarThemeData(
        backgroundColor: _lightBackgroundAlertColor,
        actionTextColor: _lightBackgroundActionTextColor),
    iconTheme: IconThemeData(
      color: _lightIconColor,
    ),
    popupMenuTheme: PopupMenuThemeData(color: _lightBackgroundAppBarColor),
    textTheme: _lightTextTheme,
    buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        buttonColor: _lightPrimaryColor,
        textTheme: ButtonTextTheme.primary),
    unselectedWidgetColor: _lightPrimaryColor,
    inputDecorationTheme: InputDecorationTheme(
      //prefixStyle: GoogleFonts.lato(color: _lightIconColor),
      border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          )),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _lightBorderColor, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _lightBorderActiveColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _lightBorderErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _lightBorderErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      fillColor: _lightBackgroundSecondaryColor,
      //focusColor: _lightBorderActiveColor,
    ),
  );

  static final TextTheme _darkTextTheme = TextTheme(
    // * Extremely large text.
    headline1: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.red),
    // * Used for the date in the dialog shown by showDatePicker.
    headline2: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.blue),
    // * Very large text.
    headline3: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w400, color: Colors.orange),
    // * Large text.
    headline4: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w300, color: Colors.green),
    // * Used for large text in dialogs (e.g., the month and year in the dialog shown by showDatePicker).
    headline5: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w200, color: _darkTextColor),
    // * Used for the primary text in app bars and dialogs (e.g., AppBar.title and AlertDialog.title).
    headline6: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w800, color: _darkTextColor),
    // * Used for the primary text in lists (e.g., ListTile.title).
    subtitle1: GoogleFonts.lato(fontSize: 16.0, fontWeight: FontWeight.normal, color: _darkTextColor),
    // * For medium emphasis text that's a little smaller than subtitle1.
    subtitle2: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.normal, color: Colors.blueAccent),
    // * Used for emphasizing text that would otherwise be bodyText2.
    bodyText1: GoogleFonts.lato(fontSize: 16.0, color: _darkTextColor),
    // * The default text style for Material.
    bodyText2: GoogleFonts.lato(fontSize: 16.0, color: _darkTextColor),
    // * Used for auxiliary text associated with images.
    caption: GoogleFonts.lato(fontSize: 12.0, color: _darkBackgroundAppBarColor),
    // * Used for text on ElevatedButton, TextButton and OutlinedButton.
    button: GoogleFonts.lato(fontSize: 16.0, color: _darkTextColor, fontWeight: FontWeight.w600),
    // * Typically used for captions or to introduce a (larger) headline.
    overline: GoogleFonts.lato(fontSize: 16.0, color: _darkTextColor, fontWeight: FontWeight.w600),
  );

  //the dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    //primarySwatch: _darkPrimaryColor, //cant be Color on MaterialColor so it can compute different shades.
    accentColor: _darkPrimaryColor,
    //prefix icon color form input on focus

    fontFamily: GoogleFonts.lato.toString(),
    scaffoldBackgroundColor: _darkBackgroundColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _darkPrimaryColor,
    ),
    appBarTheme: AppBarTheme(
      color: _darkBackgroundAppBarColor,
      iconTheme: IconThemeData(color: _darkTextColor),
      textTheme: _darkTextTheme,
    ),
    colorScheme: ColorScheme.dark(
      primary: _darkPrimaryColor,
      primaryVariant: _darkBackgroundColor,

      // secondary: _darkSecondaryColor,
    ),
    snackBarTheme: SnackBarThemeData(
        contentTextStyle: GoogleFonts.lato(color: Colors.white),
        backgroundColor: _darkBackgroundAlertColor,
        actionTextColor: _darkBackgroundActionTextColor),
    iconTheme: IconThemeData(
      color: _darkIconColor, //_darkIconColor,
    ),
    popupMenuTheme: PopupMenuThemeData(color: _darkBackgroundAppBarColor),
    textTheme: _darkTextTheme,
    buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        buttonColor: _darkPrimaryColor,
        textTheme: ButtonTextTheme.primary),
    unselectedWidgetColor: _darkPrimaryColor,
    inputDecorationTheme: InputDecorationTheme(
      prefixStyle: GoogleFonts.lato(color: _darkIconColor),
      //labelStyle: GoogleFonts.lato(color: nevada),
      border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          )),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _darkBorderColor, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _darkBorderActiveColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _darkBorderErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _darkBorderErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      fillColor: _darkInputFillColor,
      //focusColor: _darkBorderActiveColor,
    ),
  );
}
