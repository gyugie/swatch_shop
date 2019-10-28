import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  static const routeName  = '/edit-profile';
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _userInfoTitle    = TextStyle(color: Colors.grey, fontSize: 14);
  final _userInfoValue    = TextStyle(color: Colors.black,  fontSize: 14);
  var _initValue          = {'username':'','full_name':'','email':'','phone':'','gender':'','date_of_bird':'','address':''};

  @override
  void didChangeDependencies(){
    _initValue =  {
      'username':'Gyugie',
      'full_name':'Mugiono Arif S',
      'email':'mugypleci@gmail.com',
      'phone':'0896528074',
      'gender':'Male',
      'date_of_bird':'1994/03/26',
      'address':'Jl. Naggrog 3 RT04/09 no.144, kelurahan pasir jati kecamatan Ujungberung Bandung, Kota Bandung'
      };
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
                              onSaved: null,
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
                              validator: (value){},
                              onSaved: (value){},
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
                      title: Text('Phone',  style: _userInfoTitle),
                      trailing:new Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            width: deviceSize.width * 0.5,
                            child: TextFormField(
                              autofocus: false,
                              initialValue: _initValue['phone'],
                              validator: (value){},
                              onSaved: (value){},
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
                              validator: (value){},
                              onSaved: (value){},
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
                            onFieldSubmitted: (_){
                            },
                            onSaved: (value){
                              
                            },
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
                      onPressed: () {},
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
