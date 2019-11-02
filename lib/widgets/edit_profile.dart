import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/user.dart';

class EditProfile extends StatefulWidget {
  static const routeName  = '/edit-profile';
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _userInfoTitle    = TextStyle(color: Colors.grey, fontSize: 14);
  final _userInfoValue    = TextStyle(color: Colors.black,  fontSize: 14);
  final _userForm         = GlobalKey<FormState>();
  var _dateOfBird         = TextEditingController();
  var _editUser           = User(userName: '', email: '' ,dateOfBird: null,fullName: '',imageUrl: '',phone: null, address: '',gender: '');
  var _initValue          = {'username':'','full_name':'','email':'','phone':'','gender':'','date_of_bird': '','address':''};
  DateTime _selectDate;
  var _isInit             = true;

  @override
  void dispose(){
    _dateOfBird.dispose();
    super.dispose();
  }  

 
  void _updateUserData() async {
    final validate  = _userForm.currentState.validate();

    if(!validate){
      return;
    }

    _userForm.currentState.save();
    print(_editUser.userName);
  }

  void _presentDatePicker() async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.amber,
            accentColor: Colors.black
          ),
          child: child,
        );
      },
    ).then((pickDate){
      if(pickDate == null){
        return;
      }

      setState(() {
        _selectDate = pickDate;
        _dateOfBird.text = DateFormat('yyyy-MM-dd').format(pickDate);
      });
     
    });

  }

  @override
  void didChangeDependencies(){

      if(_isInit){
          _editUser = Provider.of<UserData>(context).getUserProfile();
         _initValue =  {
          'username': _editUser.userName,
          'full_name':_editUser.fullName,
          'email': _editUser.email,
          'phone': _editUser.phone != null ? _editUser.toString() : '' ,
          'gender': _editUser.gender,
          'date_of_bird': _editUser.dateOfBird != null ? _editUser.dateOfBird.toString() : '',
          'address': _editUser.address
          };
      }

      _isInit = false;

    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: deviceSize.height * 0.15,
              width: double.infinity,
              child: Image.asset('assets/images/background-profile.jpg', fit: BoxFit.fitWidth),
            ),
            Card(
                child: Column(
                  children: <Widget>[
                    Form(
                      key: _userForm,
                      child: Column(
                        children: <Widget>[
                          Container(
                              child:  ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage('https://i0.wp.com/zblogged.com/wp-content/uploads/2019/02/FakeDP.jpeg?resize=567%2C580&ssl=1'),
                              ),
                              trailing: FlatButton(
                                child: Text('Edit Foto', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                                onPressed: (){
                                  
                                },
                              )
                            ),
                          ),
                          Container(
                              child:  ListTile(
                              title: Text('Username',  style: _userInfoTitle),
                              trailing:new Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    width: deviceSize.width * 0.5,
                                    child: TextFormField(
                                      autofocus: false,
                                      initialValue: _initValue['username'],
                                      validator: (value){
                                        if(value.isEmpty){
                                          return 'Please fill username';
                                        }
                                      },
                                      onSaved: (value){
                                        _editUser = User(
                                          userName: value,
                                          fullName: _editUser.fullName,
                                          email: _editUser.email,
                                          gender: _editUser.gender,
                                          dateOfBird: _editUser.dateOfBird,
                                          phone: _editUser.phone,
                                          address: _editUser.address,
                                          imageUrl: _editUser.imageUrl
                                        );
                                      },
                                    )
                                  ),
                                ],
                              )
                            ),
                          ),
                          Divider(),
                          Container(
                              child:  ListTile(
                              title: Text('Full Name',  style: _userInfoTitle),
                              trailing:new Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    width: deviceSize.width * 0.5,
                                    child: TextFormField(
                                      autofocus: false,
                                      initialValue: _initValue['full_name'],
                                      validator: (value){
                                        if(value.isEmpty){
                                          return 'Please fill full name';
                                        }
                                      },
                                      onSaved: (value){
                                        _editUser = User(
                                          userName: _editUser.userName,
                                          fullName: value,
                                          email: _editUser.email,
                                          gender: _editUser.gender,
                                          dateOfBird: _editUser.dateOfBird,
                                          phone: _editUser.phone,
                                          address: _editUser.address,
                                          imageUrl: _editUser.imageUrl
                                        );
                                      },
                                    )
                                  ),
                                ],
                              )
                            ),
                          ),
                          Container(
                              child:  ListTile(
                              title: Text('E-mail',  style: _userInfoTitle),
                              trailing:new Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    width: deviceSize.width * 0.5,
                                    child: TextFormField(
                                      enabled: false,
                                      autofocus: false,
                                      initialValue: _initValue['email'],
                                      onSaved: null,
                                    )
                                  ),
                                ],
                              )
                            ),
                          ),
                          Container(
                              child:  ListTile(
                              title: Text('Gender',  style: _userInfoTitle),
                              trailing:new Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    width: deviceSize.width * 0.5,
                                    child: TextFormField(
                                      autofocus: false,
                                      initialValue: _initValue['gender'],
                                      validator: (value){
                                        if(value.isEmpty){
                                          return 'Please choose your gender';
                                        }
                                      },
                                      onSaved: (value){
                                        _editUser = User(
                                          userName: _editUser.userName,
                                          fullName: _editUser.fullName,
                                          email: _editUser.email,
                                          gender: value,
                                          phone: _editUser.phone,
                                          dateOfBird: _editUser.dateOfBird,
                                          address: _editUser.address,
                                          imageUrl: _editUser.imageUrl
                                        );
                                      },
                                    )
                                  ),
                                ],
                              )
                            ),
                          ),
                          Container(
                              child:  ListTile(
                              title: Text('Date Of Bird',  style: _userInfoTitle),
                              trailing:new Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    width: deviceSize.width * 0.5,
                                    child: 
                                    InkWell(
                                      onTap: _presentDatePicker,
                                      child: IgnorePointer(
                                        child:
                                          _dateOfBird.text.isEmpty ?
                                          TextFormField(
                                            autofocus: false,
                                            initialValue: _initValue['date_of_bird'],
                                            validator: (value){
                                              if(value.isEmpty){
                                                return 'Please choose date of bird';
                                              }
                                            },
                                          )
                                          :
                                          TextFormField(
                                            autofocus: false,
                                            controller: _dateOfBird,
                                            validator: (value){
                                              if(value.isEmpty){
                                                return 'Please choose date of bird';
                                              }
                                            },
                                            onSaved: (value){
                                              _editUser = User(
                                                  userName: _editUser.userName,
                                                  fullName: value,
                                                  email: _editUser.email,
                                                  gender: _editUser.gender,
                                                  dateOfBird: _selectDate,
                                                  phone: _editUser.phone,
                                                  address: _editUser.address,
                                                  imageUrl: _editUser.imageUrl
                                                );
                                            },
                                          )
                                      )
                                    )
                                  ),
                                ],
                              )
                            ),
                          ),
                          Container(
                              child:  ListTile(
                              title: Text('Phone',  style: _userInfoTitle),
                              trailing:new Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    width: deviceSize.width * 0.5,
                                    child: TextFormField(
                                      autofocus: false,
                                      keyboardType: TextInputType.number,
                                      initialValue: _initValue['phone'],
                                      validator: (value){
                                        if(value.length < 10){
                                          return 'Number phone is not valid';
                                        }
                                      },
                                      onSaved: (value){
                                        _editUser = User(
                                                  userName: _editUser.userName,
                                                  fullName: _editUser.fullName,
                                                  email: _editUser.email,
                                                  gender: _editUser.gender,
                                                  dateOfBird: _editUser.dateOfBird,
                                                  phone: int.parse(value),
                                                  address: _editUser.address,
                                                  imageUrl: _editUser.imageUrl
                                                );
                                      },
                                    )
                                  ),
                                ],
                              )
                            ),
                          ),
                          Container(
                            width: deviceSize.width * 0.9,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Text('Address', style: _userInfoTitle),
                                  ),
                                  Container(
                                    width: deviceSize.width * 0.5,
                                    child: TextFormField(
                                    initialValue: _initValue['address'],
                                    decoration: InputDecoration(
                                      labelText: 'Address'
                                    ),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    validator: (value){ 
                                      if(value.isEmpty){
                                        return 'Description is required!';
                                      }

                                      if(value.length < 10){
                                        return 'Should be at least a long text';
                                      }

                                      return null;
                                    },
                                    onSaved: (value){
                                      _editUser = User(
                                                  userName: _editUser.userName,
                                                  fullName: _editUser.fullName,
                                                  email: _editUser.email,
                                                  gender: _editUser.gender,
                                                  dateOfBird: _editUser.dateOfBird,
                                                  phone: _editUser.phone,
                                                  address: value,
                                                  imageUrl: _editUser.imageUrl
                                                );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    ButtonTheme(
                      minWidth: deviceSize.width * 0.9,
                      height: 45.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(50.0),
                        ),
                        color: Colors.amber,
                        onPressed:_updateUserData,
                        child: Text("Save", style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }
}
