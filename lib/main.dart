import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      ///Ici tu dois changer le nom de la classe que tu appel, tu as le choix entre MyHomePage, MyHomePage2 et MyHomePage3
      ///ATTENTION à chaque changement tu dois faire un cold refresh et non un hot reload !!! sinon ca marchera pas !
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

///ICI tu as l'app de base de Flutter avec le counter qui fonctionne
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  ///ICi tu remarques l'implémentation du setstate qui permet de mettre à jour la valeur automatiquement, et c'est pour ca qu'on a un stateful widget
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}

///Ici j'ai juste copier-coller l'app de base, mais j'ai retiré le setstate pour te montrer que ca ne peut par fonctioner sans
class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState2 createState() => _MyHomePageState2();
}

class _MyHomePageState2 extends State<MyHomePage2> {
  int _counter = 0;

  ///ICi tu remarques que le setstate a disparu
  void _incrementCounter() {
      _counter++;
      ///je rajoute un print pour prouver que la valeur change bien, mais que c'est bien le buildcontext qui ne suit pas
      print(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}


///Ici j'ai carrément dégagé le stateful, remplacé par un GetView car à présent on va utiliser GetX
class MyHomePage3 extends GetView {
  MyHomePage3({Key key, this.title}) : super(key: key);

  final String title;

  ///ATTENTION tu ne peux pas mettre le int devant ta variable
  var _counter = 0.obs;
  //alternative d'écriture
  //var _counter = RxInt(0);

  ///ICi tu remarques que le setstate a disparu
  void _incrementCounter() {
    _counter++;
    ///je rajoute un print pour prouver que la valeur change bien, mais que c'est bien le buildcontext qui ne suit pas
    print(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            ///Ici je mets Obx( () { return Widget}) ou Obx( () =>), je return le widget qui doit changer avec la valeur de la propriété
            Obx( () => Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}