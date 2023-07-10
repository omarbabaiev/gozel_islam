import 'package:jiffy/jiffy.dart';
import 'package:get/get.dart';
class Controller extends GetxController {



  var isShow = false.obs;
  var isShowPrayerTime = false.obs;
  var isShowHikmetliSoz = true.obs;
  var widgetPageObs;
  var isShowEKart = true.obs;
  var isShowDua = true.obs;
  var isShowShuhada = true.obs;
  var isShowBook = true.obs;
  var isShowGunlukMovzu = true.obs;
  var difference =Jiffy.now().dayOfYear;
  var difference2 = Jiffy.now().dayOfYear.obs;
  var difference3 = Jiffy.now().dayOfYear.obs;
  var cityname = "Bakı".obs;
  var loadingTime = false.obs;
  var daylyCounter = 0.obs;
  var allCounter = 0.obs;
  var zikrSayisi = 0.obs;
  var circularPrTime = "".obs ;
  var scrollOffset = 4.obs;
  var hikmetliSozler = "".obs;
  var duration ;
  var zikrCounter = 0;
  var isJumah = false.obs;







  void lastDay(){
    if(!(difference < 0)){
      difference--;
    }
  }
  void nextDay(){
    if(!(difference > 364 )){
      difference++;
    }
  }


}