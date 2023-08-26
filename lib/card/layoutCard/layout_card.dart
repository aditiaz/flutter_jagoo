import 'package:flutter/material.dart';
import 'package:jagoo_latihan/card/card.dart';
import 'package:jagoo_latihan/card/card_row.dart';

class LayoutCard extends StatefulWidget {
  const LayoutCard({Key? key}) : super(key: key);

  @override
  State<LayoutCard> createState() => _TabbarExampleState();
}

class _TabbarExampleState extends State<LayoutCard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios),
              ),
              const Text(
                'Dummy UI',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23.0),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2.0,
            tabs: [
              Tab(
                text: "List View",
              ),
              Tab(
                text: "Grid View",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: ListView.builder(
                itemCount: 20,
                padding: EdgeInsets.only(top: 15),
                itemBuilder: (BuildContext context, int index) {
                  return ListBody(
                    children: [
                      SizedBox(height: 15),
                      Container(
                        width: 50,
                        child: CardDummy(src: 'lib/assets/briefcase.svg'),
                      ),
                    ],
                  );
                },
              ),
            ),
            Center(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                      padding: EdgeInsets.all( 15),
                  itemCount: 20,
                  itemBuilder: (BuildContext ctx, index) {
                    return CardRow(
                      title: '1st Image',
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
