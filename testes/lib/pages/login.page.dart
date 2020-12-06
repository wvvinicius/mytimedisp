import 'package:flutter/material.dart';
import 'package:testes/views/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Positioned(
                  width: MediaQuery.of(context).size.width,
                  top: MediaQuery.of(context).size.width * 0.30,
                  child: Container(
                    margin: EdgeInsets.all(16.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('assets/logo2.png'),
                          SizedBox(
                            height: 20,
                          ),
                        ]),
                  )),
              Text(
                'Bem-Vindo',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blueGrey[300],
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Divider(),
              ButtonTheme(
                  height: 60.0,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text(
                      "Continuar",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.blueGrey[300],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
