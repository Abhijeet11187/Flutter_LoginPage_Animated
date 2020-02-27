import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  //Variables
  var _formAction = "Login";
  var _userStatus = " New User ? ";
  bool _isRegistrationForm = false;
  bool _autoValidate = false;

  //Form Controllers
  final _userName = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  //Global Key
  var _formKey = GlobalKey<FormState>();



  //Widgets
  Widget _userNameWidget() {
    return TextFormField(
      controller: _userName,
      decoration: InputDecoration(
          hintText: "User Name",
          errorStyle: TextStyle(
              // color: Colors.yellow,
              fontSize: 15.0)),
      validator: (String value) {
        if (value.isEmpty) {
          return "Enter User Name";
        }
      },
    );
  }

  Widget _passwordWidget() {
    return TextFormField(
      controller: _password,
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Password",
          errorStyle: TextStyle(
              //  color: Colors.yellow,
              fontSize: 15.0)),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Enter Password';
        }
      },
    );
  }

  Widget _confirmPasswordWidget() {
    return TextFormField(
      controller: _confirmPassword,
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Confirm Password",
          errorStyle: TextStyle(
              //  color: Colors.yellow
              )),
      validator: (String value) {
        if (value != _password.text) {
          return "Password Not Matched";
        }
      },
    );
  }

//Build Method

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        autovalidate: _autoValidate,
        key: _formKey,
        child: AnimatedContainer(
            height: _isRegistrationForm
                ? MediaQuery.of(context).size.height * 0.55
                : MediaQuery.of(context).size.height * 0.50,
            width: MediaQuery.of(context).size.width * 0.75,
            duration: Duration(seconds: 1),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: Colors.white30,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
        Padding(padding: EdgeInsets.all(30)),
        _userNameWidget(),
        Padding(padding: EdgeInsets.only(top: 30)),
        _passwordWidget(),
        _isRegistrationForm
            ? Padding(padding: EdgeInsets.only(top: 30))
            : Text(""),
        _isRegistrationForm ? _confirmPasswordWidget() : Text(""),
        Padding(padding: EdgeInsets.only(top: 30)),
        RaisedButton(
          onPressed: () {
            setState(() {
              _autoValidate = true;
            });
            if (_formKey.currentState.validate()) {
              print("Welcome ${_userName.value}");
            }
          },
          child: Text(_formAction),
        ),
        Padding(padding: EdgeInsets.only(top: 30)),
        FlatButton(
          child: Text(_userStatus),
          onPressed: () {
            setState(() {
              _isRegistrationForm = !_isRegistrationForm;
              _formAction == "Login"
                  ? _formAction = "Registration"
                  : _formAction = "Login";
              _userStatus == " New User ? "
                  ? _userStatus = " Already Have Account ?"
                  : _userStatus = " New User ? ";
            });
          },
        )
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}
