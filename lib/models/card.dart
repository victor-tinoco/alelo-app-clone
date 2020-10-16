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

  VoucherCard({this.cardnumber, this.voucherType});
}
