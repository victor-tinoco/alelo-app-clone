import 'package:alelo_app_clone/models/card.dart';
import 'package:alelo_app_clone/widgets/navbar.dart';
import 'package:alelo_app_clone/widgets/voucher_card_widget.dart';
import 'package:flutter/material.dart';

class CardDetailsPage extends StatefulWidget {
  final VoucherCard card;

  CardDetailsPage(this.card, {Key key}) : super(key: key);

  @override
  _CardDetailsPageState createState() => _CardDetailsPageState();
}

class _CardDetailsPageState extends State<CardDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {}),
        title: Text(
          'Meus cartões',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Center(child: VoucherCardComponent(voucherCard: widget.card)),
          ]),
        ),
      ),
    );
  }
}
