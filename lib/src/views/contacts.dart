import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 120,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _ContactsHeader(),
                      SizedBox(height: 20),
                      _SearchBar(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _Favourites(),
                  _ContactsLister(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactsLister extends StatelessWidget {
  const _ContactsLister({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
      margin: EdgeInsets.fromLTRB(8, 5, 8, 0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: List.generate(10, (int index) {
          return _CallerTile();
        }),
      ),
    );
  }
}

class _CallerTile extends StatelessWidget {
  const _CallerTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Card(
                margin: EdgeInsets.all(0),
                elevation: 1,
                shape: CircleBorder(),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white10,
                  // backgroundImage: CachedNetworkImageProvider(),
                ),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Emma Johnson',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'emmajohnson@live.com',
                    style: TextStyle(color: Colors.white54),
                    textScaleFactor: 0.7,
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {},
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class _Favourites extends StatelessWidget {
  const _Favourites({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 25, top: 20),
          child: Text(
            'Favourites'.toUpperCase(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 80,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin: EdgeInsets.only(left: index == 0 ? 25 : 0, right: 10),
                elevation: 8,
                shape: CircleBorder(),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                  // backgroundImage: CachedNetworkImageProvider(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(25, 10, 25, 10),
          hintText: 'Search Contacts'.toUpperCase(),
          hintStyle: TextStyle(fontSize: 12),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class _ContactsHeader extends StatelessWidget {
  const _ContactsHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.people,
              size: 20,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(width: 25),
            Text(
              'Contacts'.toUpperCase(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Card(
          margin: EdgeInsets.all(0),
          elevation: 5,
          shape: CircleBorder(),
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            // backgroundImage: CachedNetworkImageProvider(),
          ),
        ),
      ],
    );
  }
}
