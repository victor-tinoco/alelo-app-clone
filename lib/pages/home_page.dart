import 'package:alelo_app_clone/%20constants.dart';
import 'package:alelo_app_clone/models/card.dart';
import 'package:alelo_app_clone/widgets/voucher_card_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  setIdx(int index) {
    setState(() => this._index = index);
  }

  List<VoucherCard> cardList = [
    VoucherCard(cardnumber: 5445400348917874, voucherType: VoucherType.MEAL),
    VoucherCard(cardnumber: 5445400348917874, voucherType: VoucherType.FOOD),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Olá, Victor',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(width: 10),
            Text(
              '=)',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Constants.purple, fontSize: 16),
            ),
          ],
        ),
      ),
      body: Column(children: [
        CarouselSlider(
          items: cardList
              .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: VoucherCardComponent(voucherCard: e),
                  ))
              .toList(),
          options: CarouselOptions(
            height: 190,
            enableInfiniteScroll: false,
            viewportFraction: 0.83,
            onPageChanged: (index, reason) => setIdx(index),
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: (MediaQuery.of(context).size.width * .085) + 8,
          ),
          width: double.infinity,
          child: Text(
            '12/10 às 20:07h',
            textAlign: TextAlign.end,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(fontSize: 12, color: Colors.grey),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: cardList.map((card) {
            int index = cardList.indexOf(card);
            return Container(
              width: 7.0,
              height: 7.0,
              margin: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _index == index ? Colors.grey[600] : Colors.grey[350],
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
