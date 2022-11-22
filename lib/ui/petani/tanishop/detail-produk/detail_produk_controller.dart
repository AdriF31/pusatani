import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:pusatani/base/base_controller.dart';

class DetailProdukController extends BaseController{
    CurrencyTextInputFormatter formatter =
      CurrencyTextInputFormatter(decimalDigits: 0, locale: 'id', symbol: 'Rp ');
}