import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
      padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Order swatch#123', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                Text(DateFormat.yMMMd().format(DateTime.now()), style: TextStyle(fontSize: 16, color: Colors.grey)),
              ],
            ),
            SizedBox(height: 10),
            Row(
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
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('Total Amount : ', style: TextStyle(fontSize: 16, color: Colors.grey)),
                Text('3', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
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
}