import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).primaryColor,
      selectedLabelStyle:
          Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 10),
      unselectedLabelStyle:
          Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 10),
      backgroundColor: Color(0xFFF2F2F2),
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            title: Text('Início')),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.card_membership,
            size: 30,
          ),
          title: Text('Clube Alelo'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications,
            size: 30,
          ),
          title: Text('Mensagens'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            size: 30,
          ),
          title: Text('Opções'),
        ),
      ],
    );
    ;
  }
}
