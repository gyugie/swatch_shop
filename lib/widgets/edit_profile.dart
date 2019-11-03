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
  var _editUser           = User(id:'', userId: '', email: '' ,password: '', dateOfBird: null,fullName: '',imageUrl: '',phone: null, address: '',gender: '');
  var _initValue          = {'username':'','id':'','userId':'','password':'','full_name':'','email':'','phone':'','gender':'','date_of_bird': '','address':''};
  var _isInit             = true;
  var _isLoading          = false;
  DateTime _selectDate;
  String _selectedGender;
  String _selectedGenderValidation;

  @override
  void dispose(){
    _dateOfBird.dispose();
    super.dispose();
  }  

 
  void _updateUserData() async {
    var validate  = _userForm.currentState.validate();

    if(_selectedGender == null ){
      setState(() {
        _selectedGenderValidation = 'Please choose an option';
      });
      validate = false;
    }

    if(!validate){
      return;
    }

    _userForm.currentState.save();
    setState(() {
      _isLoading = true;
    });
   try{
     await Provider.of<UserData>(context, listen: false).updateUser(_editUser.id, _editUser);
   } catch (err){
     showDialog(
       context: context,
       builder: (ctx) => AlertDialog(
         title: Text('An Error Occured'),
         content: Text(err),
         actions: <Widget>[
           FlatButton(
             child: Text('close', style: TextStyle(color: Colors.red)),
             onPressed: (){
               Navigator.of(context).pop();
             },
           )
         ],
       )
     );
   }
   setState(() {
      _isLoading = false;
    });
  Navigator.of(context).pop();
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
          'id': _editUser.id,
          'userId': _editUser.userId,
          'password': _editUser.password,
          'userName': _editUser.userName,
          'fullName':_editUser.fullName,
          'email': _editUser.email,
          'phone': _editUser.phone != null ? _editUser.phone.toString() : '' ,
          'gender': _editUser.gender,
          'date_of_bird': _editUser.dateOfBird != null ? DateFormat.yMd().format(_editUser.dateOfBird) : '',
          'address': _editUser.address
          };
          _selectedGender = _editUser.gender;
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
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: 
                                  _initValue['imageUrl'] != null
                                  ?
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(_initValue['imageUrl']),
                                  )
                                  :
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.white,
                                    child: new Icon(
                                      Icons.person_pin,
                                      color: Colors.grey[350], 
                                      size: 60.0,
                                    ), 
                                  ),
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
                                      initialValue: _initValue['userName'],
                                      validator: (value){
                                        if(value.isEmpty){
                                          return 'Please fill username';
                                        }
                                      },
                                      onSaved: (value){
                                        _editUser = User(
                                          id: _editUser.id,
                                          userId: _editUser.userId,
                                          password: _editUser.password,
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
                                      initialValue: _initValue['fullName'],
                                      validator: (value){
                                        if(value.isEmpty){
                                          return 'Please fill full name';
                                        }
                                      },
                                      onSaved: (value){
                                        _editUser = User(
                                          id: _editUser.id,
                                          userId: _editUser.userId,
                                          password: _editUser.password,
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
                                    child: DropdownButton<String>(
                                      value: _selectedGender,
                                      icon: null,
                                      iconSize: 24,
                                      elevation: 16,
                                      style: TextStyle(color: Colors.black),
                                      hint: Text('Choose Gender'),
                                      underline: Container(
                                        height: 2,
                                        color: Colors.grey,
                                      ),
                                      onChanged: (String value) {
                                        setState(() {
                                          _selectedGender = value;
                                          _selectedGenderValidation = null;
                                        });

                                         _editUser = User(
                                              id: _editUser.id,
                                              userId: _editUser.userId,
                                              password: _editUser.password,
                                              userName: _editUser.userName,
                                              fullName: _editUser.fullName,
                                              email: _editUser.email,
                                              gender: value,
                                              dateOfBird: _editUser.dateOfBird,
                                              phone: _editUser.phone,
                                              address: _editUser.address,
                                              imageUrl: _editUser.imageUrl
                                            );
                                      },
                                      items: <String>['Male','Female']
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              )
                            ),
                          ),
                          _selectedGenderValidation == null
                          ? 
                          SizedBox.shrink()
                          :
                          Container(
                              child:  ListTile(
                              title: Text('',  style: _userInfoTitle),
                              trailing:new Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    width: deviceSize.width * 0.5,
                                    child: Text(_selectedGenderValidation, style: TextStyle(color: Colors.red))
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
                                                  id: _editUser.id,
                                                  userName: _editUser.userName,
                                                  userId: _editUser.userId,
                                                  password: _editUser.password,
                                                  fullName: _editUser.fullName,
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
                                                  id: _editUser.id,
                                                  userName: _editUser.userName,
                                                  userId: _editUser.userId,
                                                  password: _editUser.password,
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
                                                  id: _editUser.id,
                                                  userName: _editUser.userName,
                                                  userId: _editUser.userId,
                                                  password: _editUser.password,
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
                        child:  _isLoading ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)) : Text("Save", style: TextStyle(fontSize: 16)),
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
