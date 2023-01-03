import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:english_words/english_words.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Pertama',
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                // ignore: sort_child_properties_last
                child: Text('Sidebar'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: const Text('Halaman Utama'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(
                            title: const Text('ingin bekerja'),
                          ),
                          body: const Text('Ini adalah halaman Utama'),
                        );
                      },
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Tentang Kami'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(
                            title: const Text('Tentang Kami'),
                          ),
                          body: const Text('Ini adalah halaman Tentang Kami'),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('aplikasi kata bahasa inggris'),
        ),
        body: const RandonWord(),
      ),
    );
  }
}

class RandonWord extends StatefulWidget {
  const RandonWord({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RandonWordState createState() => _RandonWordState();
}

class _RandonWordState extends State<RandonWord> {
  String randomWord = WordPair.random().asString;
  List<String> saveWords = [];

  void _changeWord() {
    setState(() {
      randomWord = WordPair.random().asString;
    });
  }

  void _saveWord() {
    saveWords.add(randomWord);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(randomWord),
            ),
            body: Text(saveWords.join("-")),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              randomWord,
              style: const TextStyle(fontSize: 28),
            ),
            IconButton(
              onPressed: _saveWord,
              icon: const Icon(Icons.favorite_border),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeWord,
        backgroundColor: Colors.black,
        mini: true,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
