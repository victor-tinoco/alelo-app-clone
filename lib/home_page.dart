import 'package:alelo_app_clone/constants.dart';
import 'package:alelo_app_clone/models/voucher_card_model.dart';
import 'package:alelo_app_clone/widgets/more_alelo_option_widget.dart';
import 'package:alelo_app_clone/widgets/voucher_card_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCardIndex = 0;
  double _sidesPadding = 16;

  _setSelectedCardIdx(int idx) {
    setState(() => this._selectedCardIndex = idx);
  }

  List<VoucherCardModel> cardList = [
    VoucherCardModel(
      cardnumber: 5461456433124645,
      voucherType: VoucherType.MEAL,
      availableCredit: 890,
    ),
    VoucherCardModel(
      cardnumber: 4687912345647989,
      voucherType: VoucherType.FOOD,
      availableCredit: 1250.35,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Olá, Victor', style: Theme.of(context).textTheme.headline4),
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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey[700],
        selectedLabelStyle:
            Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 10),
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontSize: 10, color: Colors.grey),
        backgroundColor: Color(0xFFF2F2F2),
        items: [
          _buildNavBarItem(icon: Icons.home, label: 'Início'),
          _buildNavBarItem(icon: Icons.card_membership, label: 'Clube Alelo'),
          _buildNavBarItem(icon: Icons.notifications, label: 'Mensagens'),
          _buildNavBarItem(icon: Icons.settings, label: 'Opções'),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          CarouselSlider(
            items: cardList
                .map((e) => VoucherCardWidget(
                      card: e,
                    ))
                .toList(),
            options: CarouselOptions(
              height: 190,
              enableInfiniteScroll: false,
              viewportFraction: .83,
              onPageChanged: (index, reason) => _setSelectedCardIdx(index),
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width * .085) + 8),
            width: double.infinity,
            child: Text(
              '12/10 às 20:07h',
              textAlign: TextAlign.end,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(fontSize: 11, color: Colors.grey),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: cardList.map((e) {
              int index = cardList.indexOf(e);
              return Container(
                width: 7,
                height: 7,
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == _selectedCardIndex
                      ? Colors.grey[600]
                      : Colors.grey[350],
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _sidesPadding),
            child: Row(children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Colors.grey[200],
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: buildActionButton(context,
                      icon: Icons.store, text: 'Onde aceita'),
                ),
              ),
              Expanded(
                child: buildActionButton(context,
                    icon: Icons.assessment, text: 'Extrato'),
              ),
            ]),
          ),
          SizedBox(height: 24),
          Container(
            padding: EdgeInsets.symmetric(horizontal: _sidesPadding),
            width: double.infinity,
            child: Text(
              'Mais alelo',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headline4.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey[800],
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(_sidesPadding),
            child: Column(children: [
              Row(children: [
                MoreAleloOptionWidget(
                  description: 'Descontos e Vantagens',
                  color: Constants.lightGreen,
                  textColor: Constants.darkGreen,
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
            ]),
          )
        ]),
      ),
    );
  }

  BottomNavigationBarItem _buildNavBarItem({IconData icon, String label}) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: 30,
      ),
      label: label,
    );
  }

  Widget buildActionButton(BuildContext context, {IconData icon, String text}) {
    return Column(children: [
      Icon(
        icon,
        color: Theme.of(context).primaryColor,
      ),
      SizedBox(height: 5),
      Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(color: Colors.grey[600], fontWeight: FontWeight.w300),
      )
    ]);
  }
}
