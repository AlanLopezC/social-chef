import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _loading = false;
  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // perspective
        ..rotateX(0.01 * _offset.dy) // changed
        ..rotateY(-0.01 * _offset.dx), // changed
      alignment: FractionalOffset.center,
      child: GestureDetector(
        onPanUpdate: (details) => setState(() => _offset += details.delta),
        onDoubleTap: () => setState(() => _offset = Offset.zero),
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.cyan[300],
                      Colors.cyan[700],
                    ],
                  ),
                ),
                child: Image.asset(
                  'assets/images/food_logo.png',
                  color: Colors.black,
                  height: 380,
                ),
              ),
              // Traslada child
              Transform.translate(
                offset: Offset(0, 25),
                child: Center(
                  child: SingleChildScrollView(
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, top: 100, bottom: 20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Usuario:',
                              ),
                            ),
                            SizedBox(height: 30),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Contraseña:',
                              ),
                              obscureText: true,
                            ),
                            SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 28),
                              child: RaisedButton(
                                onPressed: () => _login(context),
                                color: Theme.of(context).primaryColor,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Iniciar Sesion',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    if (_loading)
                                      Container(
                                        height: 20,
                                        width: 20,
                                        margin: const EdgeInsets.only(left: 20),
                                        child: CircularProgressIndicator(),
                                      )
                                  ],
                                ),
                                textColor: Colors.white,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('¿No estas registrado?'),
                                SizedBox(
                                  width: 25,
                                ),
                                FlatButton(
                                  onPressed: () {
                                    _showRegister(context);
                                  },
                                  child: Text(
                                    'Registrarse',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    if (!_loading) {
      setState(() {
        _loading = true;
      });
    }
  }

  void _showRegister(BuildContext context) {
    Navigator.of(context).pushNamed('/register');
  }
}
