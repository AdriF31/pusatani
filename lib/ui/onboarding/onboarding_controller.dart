import 'package:carousel_slider/carousel_controller.dart';
import 'package:pusatani/base/base_controller.dart';

class OnboardingController extends BaseController {
  var currentIndex = 0;
  CarouselController carouselController = CarouselController();
  List onboarding = [
    {
      'title': 'Informasi Petani',
      'desc':
          'Anda akan mendapatkan informasi terkait dengan petani masa kini dan informasi hasil panen yang berkualitas.'
    },
    {
      'title': 'Informasi Harga Padi',
      'desc':
          'Anda akan mendapatkan informasi terkait harga beli gabah dan harga jual pupuk di pabrik dan toko.'
    }
  ];
}
