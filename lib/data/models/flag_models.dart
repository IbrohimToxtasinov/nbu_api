import 'package:nbu_api/utils/images.dart';

class NbuFlags {
  String imageName;
  bool isCliked;

  NbuFlags({
    required this.imageName,
    required this.isCliked,
    }
  );
  static final flags = [
    NbuFlags(imageName: MyImages.image_AED,isCliked: false),
    NbuFlags(imageName: MyImages.image_AUD,isCliked: false),
    NbuFlags(imageName: MyImages.image_CAD,isCliked: false),
    NbuFlags(imageName: MyImages.image_CHF,isCliked: false),
    NbuFlags(imageName: MyImages.image_CNY,isCliked: false),
    NbuFlags(imageName: MyImages.image_DKK,isCliked: false),
    NbuFlags(imageName: MyImages.image_EGP,isCliked: false),
    NbuFlags(imageName: MyImages.image_EUR,isCliked: false),
    NbuFlags(imageName: MyImages.image_GBP,isCliked: false),
    NbuFlags(imageName: MyImages.image_ISK,isCliked: false),
    NbuFlags(imageName: MyImages.image_JPY,isCliked: false),
    NbuFlags(imageName: MyImages.image_KRW,isCliked: false),
    NbuFlags(imageName: MyImages.image_KWD,isCliked: false),
    NbuFlags(imageName: MyImages.image_KZT,isCliked: false),
    NbuFlags(imageName: MyImages.image_LBP,isCliked: false),
    NbuFlags(imageName: MyImages.image_MYR,isCliked: false),
    NbuFlags(imageName: MyImages.image_NOK,isCliked: false),
    NbuFlags(imageName: MyImages.image_PLN,isCliked: false),
    NbuFlags(imageName: MyImages.image_RUB,isCliked: false),
    NbuFlags(imageName: MyImages.image_SEK,isCliked: false),
    NbuFlags(imageName: MyImages.image_SGD,isCliked: false),
    NbuFlags(imageName: MyImages.image_TRY,isCliked: false),
    NbuFlags(imageName: MyImages.image_UAH,isCliked: false),
    NbuFlags(imageName: MyImages.image_USD,isCliked: false),
  ];
}