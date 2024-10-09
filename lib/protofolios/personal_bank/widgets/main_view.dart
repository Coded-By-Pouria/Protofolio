import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/bank_icons.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/accounts/accounts.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/transactions.dart';
import '../views/dashboard.dart';

class MainView extends StatefulWidget {
  final Stream<int> indexDistpacher;
  const MainView({super.key, required this.indexDistpacher});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late StreamSubscription onDispatchSub;
  int displayingViewIndex = 0;

  @override
  void initState() {
    super.initState();
    onDispatchSub = widget.indexDistpacher.listen(_onIndexDispatched);
  }

  _onIndexDispatched(int index) {
    if (index != displayingViewIndex) {
      setState(() {
        displayingViewIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MainViewTopBar(),
        Expanded(
          child: IndexedStack(
            index: displayingViewIndex,
            children: const [Dashboard(), Transactions(), AccountView()],
          ),
        )
      ],
    );
  }
}

class MainViewTopBar extends StatelessWidget {
  const MainViewTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: Theme(
        data: ThemeData(
          colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            primary: Colors.white,
            onPrimary: Colors.white,
            secondary: Color.fromARGB(255, 245, 247, 250),
            onSecondary: Color.fromARGB(255, 245, 247, 250),
            error: Colors.red,
            onError: Colors.red,
            surface: Colors.white,
            onSurface: Colors.white,
          ),
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 113, 142, 191),
          ),
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Color.fromARGB(255, 52, 60, 106),
            ),
            labelMedium: TextStyle(
              fontSize: 12,
            ),
            bodyMedium: TextStyle(
              fontSize: 12,
              color: Color.fromARGB(255, 139, 162, 203),
            ),
          ),
        ),
        child: Builder(
          builder: (context) {
            return Row(
              children: [
                Text(
                  style: Theme.of(context).textTheme.headlineLarge,
                  "چشم انداز",
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  width: 250,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Transform.flip(
                          flipX: true,
                          child: const Icon(
                            Icons.search,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.color ??
                                    Colors.black),
                            border: InputBorder.none,
                            hintText: 'عبارتی را جستجو کنید',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(
                    icon: const Icon(BankIcons.services),
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      BankIcons.notif,
                      color: Colors.red,
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('assets/images/cat.jpg'),
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}