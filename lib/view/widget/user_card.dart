import 'package:flutter/material.dart';
import 'package:smp1/view/model/user_model.dart';

class UserCard extends StatelessWidget {
  final UserModel model;
  final VoidCallback onPressed;

  const UserCard({Key key, @required this.model, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Stack(
          children: [buildListTileModel(), InkWell(onTap: onPressed)],
        ),
      ),
    );
  }

  ListTile buildListTileModel() => ListTile(title: Text(model.name), subtitle: buildWrapPointAndStar());

  Wrap buildWrapPointAndStar() {
    return Wrap(
      spacing: 5,
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Icon(Icons.star),
        Text(model.point),
      ],
    );
  }
}
