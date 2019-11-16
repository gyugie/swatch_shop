import 'package:flutter/material.dart';
import '../widgets/order_card.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> with SingleTickerProviderStateMixin {
  TabController _controller;
  var _categories   = 'delivered';
  

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
  }

  void _setCatgories(int index){
    var value = '';
    if(index == 0 ){
        value = 'delivered';
    } else if (index == 1){
        value = 'processing';
    } else {
        value = 'cancelled';
    }

    setState(() {
      _categories = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize  = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor:  Colors.grey[100],
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.search),
            onPressed: (){

            },
          )
        ],
      ),
      backgroundColor:  Colors.grey[100],
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('My Orders', style: TextStyle(fontSize: 30, color: Colors.cyan[900], fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
              SizedBox(height: 20),
              Container(
                  height: deviceSize.height * 0.05,
                  child:  TabBar(
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.transparent,
                    labelColor: Colors.white,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.cyan[900],
                    ),
                    labelStyle: TextStyle(color: Colors.black),
                    controller: _controller,
                    onTap: (index){
                    
                      _setCatgories(index);

                    },
                    tabs: [
                      Tab(
                        text: 'Delivered',
                      ),
                      Tab(
                        text: 'Processing',
                      ),
                      Tab(
                        text: 'Cancelled',
                      ),
                    ],
                  ),
                ), 
              SizedBox(height: 20),
              // tab bar
              Container(
                height: deviceSize.height * 0.66,
                padding: EdgeInsets.all(3),
                child: TabBarView(
                  controller: _controller,
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    Container(
                        child: ListView.builder(
                          itemCount: 19,
                          itemBuilder: (ctx, index) => OrderCard(),
                        )
                    ),
                    Container(
                        child: Center(
                          child: Image.asset('assets/images/cartempty.png',height: 100,),
                        ) 
                    ),
                     Container(
                        child: Center(
                          child: Image.asset('assets/images/cartempty.png',height: 100,),
                        ) 
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}