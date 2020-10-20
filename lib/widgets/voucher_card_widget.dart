import 'package:alelo_app_clone/constants.dart';
import 'package:alelo_app_clone/models/voucher_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VoucherCardWidget extends StatelessWidget {
  final VoucherCardModel card;

  const VoucherCardWidget({
    Key key,
    this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: MediaQuery.of(context).size.width / 1.27,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: _getGradientByVoucherType(),
      ),
      child: Column(children: [
        SvgPicture.asset('assets/images/logo.svg', width: 40),
        SizedBox(height: 10),
        Text(
          card.voucherType.description,
          style: Theme.of(context).textTheme.bodyText2.copyWith(
              fontWeight: FontWeight.w600, color: _getTextColorByVoucherType()),
        ),
        SizedBox(height: 10),
        Text(
          card.cardnumberHidden,
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: _getTextColorByVoucherType(),
              ),
        ),
        SizedBox(height: 10),
        Text(
          card.availableCreditFormatted,
          style: Theme.of(context).textTheme.headline4.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: _getTextColorByVoucherType(),
              ),
        ),
        SizedBox(height: 5),
        Text(
          'gaste até ${card.dailySpendTheEndOfMonthFormatted} hoje',
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: _getTextColorByVoucherType(),
              ),
        ),
      ]),
    );
  }

  Gradient _getGradientByVoucherType() {
    switch (card?.voucherType) {
      case VoucherType.FOOD:
        return Constants.darkGreenGradient;
      case VoucherType.MEAL:
        return Constants.lightGreenGradient;
      default:
        break;
    }

    return Constants.lightGreenGradient;
  }

  Color _getTextColorByVoucherType() {
    switch (card?.voucherType) {
      case VoucherType.FOOD:
        return Colors.white;
      case VoucherType.MEAL:
        return Constants.darkGreen;
      default:
        break;
    }

    return Constants.darkGreen;
  }
}
