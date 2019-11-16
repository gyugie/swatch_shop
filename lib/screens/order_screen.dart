import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/order_card.dart';
import '../providers/orders.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> with SingleTickerProviderStateMixin {
  TabController _controller;
  var _categories   = 'delivered';
  var _isInit       = true;
  var _isLoading    = false;
  var _orders;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
  }

  void _setCatgories(int index){
    var value = '';
    if(index == 0 ){
        value = 'processing';
    } else if (index == 1){
        value = 'delivered';
    } else {
        value = 'cancelled';
    }

    setState(() {
      _categories = value;
    });
  }

  _fetchOrders() async {
    try{
      await Provider.of<Orders>(context).fetchAndSetOrder();
      setState(() {
        _isLoading = false;
      });
    } catch (err){
      throw err;
    }
  }

  @override
  void didChangeDependencies() {
    if(_isInit){
      _isLoading = true;
      _fetchOrders();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize            = MediaQuery.of(context).size;
    final statusOrderDelivered  = Provider.of<Orders>(context, listen: false).findByStatus('delivered');
    final statusOrderCancelled  = Provider.of<Orders>(context, listen: false).findByStatus('cancelled');
    final statusOrderProcessing = Provider.of<Orders>(context, listen: false).findByStatus('processing'); 
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
                        text: 'Processing',
                      ),
                      Tab(
                        text: 'Delivered',
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
                child: 
                 _isLoading
                  ?
                  Center(
                    child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.amber)),
                  )
                  :
                  TabBarView(
                    controller: _controller,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      statusOrderProcessing.length == 0 
                      ?
                      Center(
                        child: Image.asset('assets/images/cartempty.png', height: 100),
                      )
                      :
                      Container(
                        child: ListView.builder(
                            itemCount: statusOrderProcessing.length,
                            itemBuilder: (ctx, index) => OrderCard(statusOrderProcessing[index]),
                          ),
                      ),
                      statusOrderDelivered.length == 0 
                      ?
                      Center(
                        child: Image.asset('assets/images/cartempty.png', height: 100),
                      )
                      :
                      Container(
                          child: ListView.builder(
                              itemCount: statusOrderDelivered.length,
                              itemBuilder: (ctx, index) => OrderCard(statusOrderDelivered[index]),
                            ),
                      ),
                       statusOrderCancelled.length == 0 
                      ?
                      Center(
                        child: Image.asset('assets/images/cartempty.png', height: 100),
                      )
                      :
                      Container(
                        child: ListView.builder(
                          itemCount: statusOrderCancelled.length,
                          itemBuilder: (ctx, index) => OrderCard(statusOrderCancelled[index]),
                        ),
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