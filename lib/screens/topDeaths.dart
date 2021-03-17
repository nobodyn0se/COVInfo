import 'package:flutter/material.dart';
import 'package:ncov_visual/pages/mainpage.dart';
import 'package:ncov_visual/provider/apiHelper.dart';

import '../screen_size.dart';

class TopListViewDeaths extends StatelessWidget {
  const TopListViewDeaths({
    @required this.prov,
  });

  final GlobalResponseHelper prov;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Top Deaths (24h)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          //always give bounded height to a listview to prevent draw errors
          height: ScreenSize.safeHeight * 27, //takes 30% of the screen
          width: ScreenSize.safeWidth * 48,
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, id) {
                return Card(
                  child: Row(
                    //outer row, spacebetween
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment:
                        CrossAxisAlignment.center, //middle of the card
                    children: [
                      buildLeadingRow(id, prov.topDed),
                      Padding(
                        padding:
                            EdgeInsets.only(right: ScreenSize.safeWidth * 1),
                        child: Text('+${prov.topDed[id].todayDeaths}'),
                      ),
                    ],
                  ),
                );
              },
              itemCount: prov.topDed.length),
        ),
      ],
    );
  }
}
