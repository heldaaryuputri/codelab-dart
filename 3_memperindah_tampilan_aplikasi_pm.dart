//3. memperindah tampilan aplikasi

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  
  void getNext(){ //add this
    current = WordPair.random();
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current; //add this

    return Scaffold(
      body: Column(
        mainAxisAlignment : MainAxisAlignment.center, //add this untuk menempatkan ui di tengah
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          ElevatedButton( //Menambahkan tombol next
          onPressed : (){
            appState.getNext(); //diganti agar tombol next bisa menampilkan kata acak
          },
          child: Text('Next')
          ),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;
  
//tema dan gaya
  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context);  // add this
     final style =  theme.textTheme.displayMedium!.copyWith(
     color: theme.colorScheme.onPrimary,
     ); //add this
    
    return Card(
      color: theme.colorScheme.primary,  // add this
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(pair.asLowerCase, style: style, semanticsLabel: "${pair.first} ${pair.second}"),//change
      ),
    );
  }
}

