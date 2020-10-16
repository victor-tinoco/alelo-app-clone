import 'package:alelo_app_clone/%20constants.dart';
import 'package:flutter/material.dart';
import 'package:alelo_app_clone/models/card.dart';
import 'package:flutter_svg/svg.dart';

class VoucherCardComponent extends StatelessWidget {
  final VoucherCard voucherCard;

  const VoucherCardComponent({
    Key key,
    this.voucherCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: _getColorByVoucherType(),
      ),
      child: Column(children: [
        SvgPicture.asset(
          'assets/images/logo.svg',
          width: 40,
        ),
        SizedBox(height: 10),
        Text(
          voucherCard.voucherType.description,
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                fontWeight: FontWeight.w600,
                color: _getTextColorByVoucherType(),
              ),
        ),
        SizedBox(height: 10),
        Text(
          '•••• •••• •••• 4466',
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: _getTextColorByVoucherType(),
              ),
        ),
        SizedBox(height: 10),
        Text(
          'R\$ 450,00',
          style: Theme.of(context).textTheme.headline4.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: _getTextColorByVoucherType(),
              ),
        ),
        SizedBox(height: 5),
        Text(
          'gaste até R\$ 20,00 hoje',
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: _getTextColorByVoucherType(),
              ),
        ),
      ]),
    );
  }

  Gradient _getColorByVoucherType() {
    switch (voucherCard?.voucherType) {
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
    switch (voucherCard?.voucherType) {
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
