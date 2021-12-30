import 'package:flutter/material.dart';
import 'package:smp1/view/model/user_model.dart';
import 'package:smp1/view/widget/user_card.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<UserModel> userList = [];

  @override
  void initState() {
    super.initState();
    userList.add(UserModel("Ali", "100"));
    userList.add(UserModel("Beyza", "1020"));
    userList.add(UserModel("Beyza2", "1020"));
    userList.add(UserModel("Beyza3", "1010"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        buildCardUserList(context),
        buildTextSubTitle(context),
        buildListViewDog(),
      ]),
    );
  }

  ListView buildListViewDog() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) => buildPaddingDogCard(),
    );
  }

  Padding buildPaddingDogCard() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(height: 200, child: buildColumnDog()),
    );
  }

  Column buildColumnDog() {
    return Column(
      children: [
        Expanded(flex: 8, child: buildImage()),
        Divider(),
        Expanded(flex: 2, child: buildFlatButtonOk()),
      ],
    );
  }

  Image buildImage() {
    return Image.network(
      "https://picsum.photos/1200/500",
      fit: BoxFit.cover,
    );
  }

  FlatButton buildFlatButtonOk() => FlatButton(onPressed: () {}, child: Text("ok"));

  Text buildTextSubTitle(BuildContext context) {
    return Text(
      "Title2",
      style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.green, fontWeight: FontWeight.bold),
    );
  }

  Card buildCardUserList(BuildContext context) {
    return Card(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        child: ListView.builder(
          itemCount: userList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => UserCard(
            model: userList[index],
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => Text("data"),
              );
            },
          ),
        ),
      ),
    );
  }
}
