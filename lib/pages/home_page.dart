import 'package:alelo_app_clone/%20constants.dart';
import 'package:alelo_app_clone/models/card.dart';
import 'package:alelo_app_clone/pages/card_details_page.dart';
import 'package:alelo_app_clone/widgets/action_button_widget.dart';
import 'package:alelo_app_clone/widgets/navbar.dart';
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
  final double _sidesPadding = 16;

  setIdx(int index) {
    setState(() => this._index = index);
  }

  List<VoucherCard> cardList = [
    VoucherCard(
      cardnumber: 5445400348917874,
      voucherType: VoucherType.MEAL,
      availableCredit: 580.90,
    ),
    VoucherCard(
      cardnumber: 5445400348916471,
      voucherType: VoucherType.FOOD,
      availableCredit: 1250.35,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildHeader(context),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          buildCardsCarousel(),
          SizedBox(height: 8),
          buildCardUpdateInfo(context),
          buildSliderIndicator(),
          SizedBox(height: 24),
          buildActionButtons(),
          SizedBox(height: 24),
          Container(
            margin: EdgeInsets.symmetric(horizontal: _sidesPadding),
            width: double.infinity,
            child: Text(
              'Mais Alelo',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headline4.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey[800]),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(_sidesPadding),
            child: buildActionsGrid(),
          )
        ]),
      ),
    );
  }

  Widget buildActionsGrid() {
    return Column(
      children: [
        Row(children: [
          MoreAleloOptionWidget(
            description: 'Descontos e Vantagens',
            color: Constants.lightGreen,
          ),
          SizedBox(width: _sidesPadding),
          MoreAleloOptionWidget(
            description: 'Adicionar cartão',
            color: Constants.darkGreen,
            textColor: Colors.white,
          ),
        ]),
        SizedBox(height: _sidesPadding),
        Row(children: [
          MoreAleloOptionWidget(
            description: 'Precisa de ajuda?',
            color: Colors.deepOrange[300],
            textColor: Colors.white,
          ),
          SizedBox(width: _sidesPadding),
          MoreAleloOptionWidget(
            description: 'Desconto em farmácias',
            color: Colors.blueGrey[600],
            textColor: Colors.white,
          ),
        ]),
      ],
    );
  }

  Widget buildActionButtons() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _sidesPadding),
      child: Row(children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: Colors.grey[200], width: 1.0),
              ),
            ),
            child: ActionButtonWidget(
              text: 'Onde aceita',
              icon: Icons.store,
            ),
          ),
        ),
        Expanded(
          child: ActionButtonWidget(
            text: 'Extrato',
            icon: Icons.assessment,
          ),
        )
      ]),
    );
  }

  Row buildSliderIndicator() {
    return Row(
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
    );
  }

  Container buildCardUpdateInfo(BuildContext context) {
    return Container(
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
            .copyWith(fontSize: 11, color: Colors.grey),
      ),
    );
  }

  CarouselSlider buildCardsCarousel() {
    return CarouselSlider(
      items: cardList
          .map((e) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CardDetailsPage(e),
                    ),
                  ),
                  child: VoucherCardComponent(voucherCard: e),
                ),
              ))
          .toList(),
      options: CarouselOptions(
        height: 190,
        enableInfiniteScroll: false,
        viewportFraction: 0.83,
        onPageChanged: (index, reason) => setIdx(index),
      ),
    );
  }

  Row buildHeader(BuildContext context) {
    return Row(
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
    );
  }
}

class MoreAleloOptionWidget extends StatelessWidget {
  final String description;
  final Color color;
  final Color textColor;

  const MoreAleloOptionWidget({
    Key key,
    this.description,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Container(
        height: 95,
        padding: const EdgeInsets.all(16),
        child: Align(
          child: Container(
            constraints: BoxConstraints(maxWidth: 100),
            child: Text(
              description,
              style: theme.textTheme.bodyText2.copyWith(
                color: textColor ?? theme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          alignment: Alignment.bottomLeft,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
