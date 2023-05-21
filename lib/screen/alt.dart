import 'package:flutter/material.dart';
import 'package:wrapperekrangecis/utils/mydrawer.dart';

class yapilcaklar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yapılacaklar Listesi',
      theme: ThemeData(primarySwatch: Colors.green),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = TextEditingController();
//listeler
  List<bool> _isCheckedList = [];
  List<String> _textList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Mydrawer(),
      appBar: AppBar(
        title: Center(child: Text("Yapılacaklar Listesi")),
      ),
      body: Column(
        children: [
          TextField(
            //yeni metin girmemizi sağlıyor
            controller: _textController,
            decoration: InputDecoration(
              hintText: 'Başlık Gir',
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            //listemizi ekranda gösterir
            child: ListView.builder(
              itemCount: _textList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  //checkbox
                  leading: Checkbox(
                    value: _isCheckedList[index],
                    onChanged: (value) {
                      setState(() {
                        _isCheckedList[index] = value!;
                      });
                    },
                  ),
                  title: Text(
                    //eğer checkbox işaretli ise yeşil değilse kırmızı yapıyor
                    _textList[index],
                    style: TextStyle(
                      color: _isCheckedList[index] ? Colors.green : Colors.red,
                    ),
                  ),
                  trailing: IconButton(
                    //çöp kutusuna tıkladığımızda tıklanan içeriği siliyor
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        _textList.removeAt(index);
                        _isCheckedList.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String text = _textController.text;
          //eğerki başlık kısmı 0 dan büyük değilse listeye ekleme yapmaz
          if (text.trim().length > 0) {
            setState(() {
              _textList.add(text);
              _isCheckedList.add(false);
              _textController.clear();
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
