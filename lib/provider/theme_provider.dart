import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
ThemeMode appTheme = ThemeMode.light ;
void changeTheme(ThemeMode newTheme){
  if(newTheme==appTheme){
    return ;
  }
  appTheme=newTheme ;
  notifyListeners() ;
}
bool isDarkTheme (){
  return appTheme == ThemeMode.dark ;

}
 bool get isDark => appTheme == ThemeMode.dark ;

}