import 'package:flutter_money_formatter/flutter_money_formatter.dart';

enum VoucherType {
  MEAL,
  FOOD,
}

extension VoucherTypeExtension on VoucherType {
  String get description {
    switch (this) {
      case VoucherType.MEAL:
        return 'Refeição';
      case VoucherType.FOOD:
        return 'Alimentação';
      default:
        return '';
    }
  }
}

class VoucherCardModel {
  int cardnumber;
  double availableCredit;
  VoucherType voucherType;

  VoucherCardModel({this.availableCredit, this.cardnumber, this.voucherType});

  String get availableCreditFormatted => _formatToBrl(this.availableCredit);

  String get cardnumberHidden {
    final number = this.cardnumber.toString();
    return '•••• •••• •••• ${number.substring(number.length - 4)}';
  }

  String get dailySpendTheEndOfMonthFormatted {
    final now = DateTime.now();
    int lastDayOfMonth = DateTime(now.year, now.month + 1, 0).day;
    final diff = lastDayOfMonth - now.day;
    return _formatToBrl(this.availableCredit / diff);
  }

  String _formatToBrl(double amount) {
    return FlutterMoneyFormatter(
      amount: amount,
      settings: MoneyFormatterSettings(
        decimalSeparator: ',',
        thousandSeparator: '.',
        symbol: 'R\$',
        fractionDigits: 2,
        symbolAndNumberSeparator: ' ',
      ),
    ).output.symbolOnLeft;
  }
}
