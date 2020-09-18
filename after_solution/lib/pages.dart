import 'package:after_solution/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      backgroundColor: Colors.red[400],
      text: 'HomePage',
      navigation: NavigationList(),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      backgroundColor: Colors.yellow[400],
      text: 'SecondPage',
      navigation: NavigationListSecondPage(),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      backgroundColor: Colors.green[400],
      text: 'ThirdPage',
      navigation: NavigationList(),
    );
  }
}

class PageScaffold extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final Widget navigation;

  const PageScaffold({
    Key key,
    this.backgroundColor,
    this.text,
    this.navigation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: this.backgroundColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              this.text,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          this.navigation,
        ],
      ),
    );
  }
}

class NavigationList extends StatelessWidget {
  const NavigationList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 100,
        height: 250,
        child: ListView(
          children: [
            IconButton(
              iconSize: 40,
              icon: Icon(Icons.home),
              onPressed: () =>
                  Navigator.of(context).pushNamed(MyRoute.homePage),
            ),
            IconButton(
              iconSize: 40,
              icon: Icon(Icons.pageview),
              onPressed: () =>
                  Navigator.of(context).pushNamed(MyRoute.secondPage),
            ),
            IconButton(
              iconSize: 40,
              icon: Icon(Icons.account_box),
              onPressed: () =>
                  Navigator.of(context).pushNamed(MyRoute.thirdPage),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationListSecondPage extends StatelessWidget {
  const NavigationListSecondPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 100,
        height: 135,
        child: ListView(
          children: [
            IconButton(
              iconSize: 40,
              icon: Icon(Icons.backspace),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
