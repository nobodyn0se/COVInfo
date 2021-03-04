import 'package:flutter/material.dart';
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
          width: ScreenSize.safeWidth * 45,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, id) {
                return Card(
                  color: Colors.grey[200],
                  child: Row(
                    //outer row, spacebetween
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment:
                        CrossAxisAlignment.center, //middle of the card
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: ScreenSize.safeHeight * 2,
                              backgroundColor: Colors.black,
                              child: CircleAvatar(
                                radius: ScreenSize.safeHeight * 1.8,
                                backgroundImage:
                                    NetworkImage('${prov.topDed[id].flagURL}') ?? Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: ScreenSize.safeHeight * 1,
                            ),
                            Expanded(
                              child: Text(
                                '${prov.topDed[id].country}',
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text('+${prov.topDed[id].todayDeaths}'),
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
