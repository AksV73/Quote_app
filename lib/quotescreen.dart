import 'package:flutter/material.dart';
import 'package:quote_app/quotemodel.dart';
import 'quote_api.dart';
//import 'package:share/share.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  QuoteApi quoteApi = QuoteApi();
  Future<QUOTE> futureQuote;
  String quote, author;
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quote generator'),
        actions: [
          IconButton(
              onPressed: (){
                setState(() {
                  futureQuote = quoteApi.GETRandomQuote();
                  setState(() {
                    opacity = 1.0;
                  });
                });
              },
              icon: Icon(Icons.refresh),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureBuilder(
                future: futureQuote,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    quote = snapshot.data.content;
                    author = snapshot.data.author;
                    return Column(
                      children: <Widget>[
                        Text(
                          "$quote",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Align(

                          child: Text(
                            "$author",
                           style: TextStyle(
                             color: Colors.black,
                             fontWeight: FontWeight.bold
                           ),
                         //  textAlign: TextAlign.end,
                          ),
                          alignment: Alignment.centerRight,
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Text('');
                },
              ),
              SizedBox(
                height: 40.0,
              ),

            ],
          ),
        ),
      ),
    );
  }
}