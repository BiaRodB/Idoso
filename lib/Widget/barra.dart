import 'package:flutter/material.dart';
import 'package:idoso/Widget/conf.dart';
import 'package:idoso/pages/Inicial.dart';
import 'package:idoso/pages/menuCuid.dart';
import 'package:idoso/pages/menuResp.dart';
import 'package:idoso/pages/menuSeg.dart';

class BottomNavBarFb5 extends StatefulWidget {
  const BottomNavBarFb5({Key? key}) : super(key: key);

  @override
  _BottomNavBarFb5State createState() => _BottomNavBarFb5State();
}

class _BottomNavBarFb5State extends State<BottomNavBarFb5> {
  final primaryColor = const Color(0xFF29335C);
  final secondaryColor = const Color(0xFF29335C);
  final accentColor = const Color(0xffffffff);
  final backgroundColor = const Color(0xffffffff);
  final errorColor = const Color(0xffEF4444);

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MenuResp()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MenuSeg()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MenuCuid()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Conf()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFF29335C),
          Color(0xFF29335C),
        ]),
      ),
      child: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconBottomBar(
                  text: "Home",
                  icon: Icons.home,
                  selected: _selectedIndex == 0,
                  onPressed: () => _onItemTapped(0),
                ),
                IconBottomBar(
                  text: "Resp",
                  icon: Icons.report,
                  selected: _selectedIndex == 1,
                  onPressed: () => _onItemTapped(1),
                ),
                IconBottomBar(
                  text: "Seg",
                  icon: Icons.security,
                  selected: _selectedIndex == 2,
                  onPressed: () => _onItemTapped(2),
                ),
                IconBottomBar(
                  text: "Cuid",
                  icon: Icons.health_and_safety_outlined,
                  selected: _selectedIndex == 3,
                  onPressed: () => _onItemTapped(3),
                ),
                IconBottomBar(
                  text: "Conf",
                  icon: Icons.settings,
                  selected: _selectedIndex == 4,
                  onPressed: () => _onItemTapped(4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);

  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  final primaryColor = const Color(0xFF29335C);
  final accentColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? accentColor : Colors.grey,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            height: .1,
            color: selected ? accentColor : Colors.grey,
          ),
        )
      ],
    );
  }
}
