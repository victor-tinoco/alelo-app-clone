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

class VoucherCard {
  int cardnumber;
  VoucherType voucherType;
  double availableCredit;

  VoucherCard({this.cardnumber, this.voucherType, this.availableCredit});

  String get dailySpendByTheEndOfMonthFormatted {
    final now = DateTime.now();
    int lastdayOfMonth = DateTime(now.year, now.month + 1, 0).day;
    final diff = lastdayOfMonth - now.day;
    return _formatToBrl(this.availableCredit / diff);
  }

  String get availableCreditFormatted => _formatToBrl(this.availableCredit);

  String get cardnumberHidden {
    final number = this.cardnumber.toString();
    return '•••• •••• •••• ${number.substring(number.length - 4)}';
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
