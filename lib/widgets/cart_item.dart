import 'package:flutter/material.dart';

class ItemCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child:  ListTile(
        leading: Image.network('https://s3.amazonaws.com/brathwait-com/transformed/02c686d5d4/photos/152755435/xl/42cde5b04a6a6e704cc3_85eb83ecd914a01fda67b892449096e1.jpg'),
        title: Text('item.name'),
        subtitle: Text('Price: 12 zł'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: (){},
            ),
            Container(
              width: 50,
              height: 50,
              color: Colors.yellow[200],
              child: Center(
                child: Text('12'),
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: (){},
            ),
          ],
        ),
      )
    );
  }
}