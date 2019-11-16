import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/orders.dart' as ord;

class OrderCard extends StatelessWidget {
final ord.OrderItem order;

OrderCard(this.order);

  @override
  Widget build(BuildContext context) {
    print(order.courierName);
    return Card(
      child: Container(
      padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('${order.orderId}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                Text(DateFormat.yMMMd().format(order.dateTime), style: TextStyle(fontSize: 16, color: Colors.grey)),
              ],
            ),
            SizedBox(height: 10),
          
            (order.courierName == 'JNE') 
            ?
            courierJne()
            :
              (order.courierName == 'J&T')
              ?
              courierJnt()
              :
              courierSicepat(),
            
           

            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('Total Amount :', style: TextStyle(fontSize: 16, color: Colors.grey)),
                Text('${order.amount}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.cyan[900])
                  ),
                  child: Text('Details',  style: TextStyle(fontSize: 16, color: Colors.cyan[900])),
                  onPressed: (){},
                ),
                Text('Delivered', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.cyan[900])),
              ],
            )
            
          ],
        ),
      ),
    );
   
  }

  Widget courierSicepat(){
    return Row(
      children: <Widget>[
        Image.asset('assets/images/SiCepat.png', width: 50),
        SizedBox(width: 10),
        RichText(
          text: TextSpan(
            text: 'SiCepat',
            style: TextStyle(fontSize: 14, color: Colors.grey),
            children: <TextSpan>[
              TextSpan(text: '\nRp. 15.000 (1 Hari Kerja)', style: TextStyle(color: Colors.black)),
            ],
          ),
        )
      ],
    );
  }
  Widget courierJnt(){
   return Row(
      children: <Widget>[
        Image.asset('assets/images/J&T.png', width: 50),
        SizedBox(width: 10),
        RichText(
          text: TextSpan(
            text: 'JNE REG ',
            style: TextStyle(fontSize: 14, color: Colors.black),
            children: <TextSpan>[
              TextSpan(text: '\nRp. 12.000 (3 Hari Kerja)', style: TextStyle(color: Colors.grey)),
            ],
          ),
        )
      ],
    );
  }
  Widget courierJne(){
    return Row(
      children: <Widget>[
        Image.asset('assets/images/JNE.png', width: 50),
        SizedBox(width: 10),
        RichText(
          text: TextSpan(
            text: 'J&T REG ',
            style: TextStyle(fontSize: 14, color: Colors.black),
            children: <TextSpan>[
              TextSpan(text: '\nRp. 14.000 (2 Hari Kerja)', style: TextStyle(color: Colors.grey)),
            ],
          ),
        )
      ],
    );
  }
}