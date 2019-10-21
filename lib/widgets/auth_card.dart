import 'package:flutter/material.dart';

enum AuthMode {Signup, Login}

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode                  = AuthMode.Login;
  FocusNode emailFocus                = new FocusNode();
  FocusNode passwordFocus             = new FocusNode();
  FocusNode confirmPasswordFocus      = new FocusNode();
  final _passwordController           = TextEditingController();
  var _isLoading                      = false;

  void _submit(){
    if(!_formKey.currentState.validate()){
      return;
    }

    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });

     setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode(){
    if(_authMode == AuthMode.Login){
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
    print(_authMode);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      height: _authMode == AuthMode.Signup ? 420 : 320,
      constraints: BoxConstraints(minHeight: _authMode == AuthMode.Signup ? 420 : 320),
      width: deviceSize.width * 0.90,
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              //email text
              TextFormField(
                focusNode: emailFocus,
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: BorderSide(width: 0, style: BorderStyle.none,
                      ),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(25.0),
                      ),
                    ),
                  fillColor: Theme.of(context).accentColor,
                  contentPadding: new EdgeInsets.all(14),
                  labelText: 'E-mail',
                  filled: true,
                  prefixIcon: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Icon(
                        Icons.mail_outline,
                        color: Colors.grey,
                      ), // icon is 48px widget.
                    ),
                  labelStyle: TextStyle(
                      color: emailFocus.hasFocus ? null : Colors.black,
                    ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value){
                  if(value.isEmpty ||  !value.contains('@')){
                    return 'Invalid E-mail';
                  }
                },
                onSaved: (value){

                },
              ),

              SizedBox(height: 10),
              //password text
              TextFormField(
                focusNode: passwordFocus,
                controller: _passwordController,
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0, 
                        style: BorderStyle.none,
                    ),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(25.0),
                    ),
                  ),
                  fillColor: Theme.of(context).accentColor,
                  contentPadding: new EdgeInsets.all(14),
                  labelText: 'Password',
                  filled: true,
                  labelStyle: TextStyle(
                      color: passwordFocus.hasFocus ? null : Colors.black,
                    ),
                  prefixIcon: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Icon(
                        Icons.lock_outline,
                        color: Colors.grey,
                      ), // icon is 48px widget.
                    ),
                  ),
                obscureText: true,
                validator: (value){
                  if(value.isEmpty || value.length < 5){
                    return 'Password is too short!';
                  }
                },
                onSaved: (value){

                },
              ),
              
              SizedBox(height: 10),
              //confirm password
              if(_authMode == AuthMode.Signup)
              TextFormField(
                focusNode: confirmPasswordFocus,
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0, 
                        style: BorderStyle.none,
                    ),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(25.0),
                    ),
                  ),
                  fillColor: Theme.of(context).accentColor,
                  contentPadding: new EdgeInsets.all(15),
                  labelText: 'Confirm Password',
                  filled: true,
                  labelStyle: TextStyle(
                      color: confirmPasswordFocus.hasFocus ? null : Colors.black,
                    ),
                  prefixIcon: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Icon(
                        Icons.lock_open,
                        color: Colors.grey,
                      ), // icon is 48px widget.
                    ),
                  ),
                obscureText: true,
                validator: _authMode == AuthMode.Signup
                  ? (value) {
                      if (value != _passwordController.text) {
                        return 'Passwords do not match!';
                      }
                    }
                  : null,
              ),
              
              SizedBox(height: 15),
              if(_isLoading)
                CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.black)
                  )
              else
                SizedBox(
                  width: deviceSize.width * 0.90,
                  height: deviceSize.height * 0.06,
                  child: RaisedButton(
                    child: Text('${_authMode == AuthMode.Login ? 'LOGIN' : 'SIGNUP'}', 
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    onPressed: _submit,
                  )
                ),

                SizedBox(height: 15),
                if(!_isLoading)
                SizedBox(
                  width: deviceSize.width * 0.90,
                  height: deviceSize.height * 0.06,
                  child: RaisedButton(
                    onPressed: _switchAuthMode,
                    child: Text('${_authMode == AuthMode.Login ? 'SIGNUP' : 'LOGIN'}', 
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                  )
                )
              
            ],
          ),
        ),
      )
    );
  }
}