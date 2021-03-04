import 'package:flutter/material.dart';
import 'package:ncov_visual/provider/apiHelper.dart';

import '../screen_size.dart';

class TopListViewRecv extends StatelessWidget {
  const TopListViewRecv({
    @required this.prov,
  });

  final GlobalResponseHelper prov;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Top Recoveries (24h)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: ScreenSize.safeHeight * 27,
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
                      Expanded( //tell the row and text that its okay to be smaller 
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: ScreenSize.safeHeight * 2,
                              backgroundColor: Colors.black,
                              child: CircleAvatar(
                                radius: ScreenSize.safeHeight * 1.8,
                                backgroundImage:
                                    NetworkImage('${prov.topRec[id].flagURL}') ?? Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: ScreenSize.safeHeight * 1,
                            ),
                            Expanded(
                              child: Text(
                                '${prov.topRec[id].country}',
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text('+${prov.topRec[id].todayRecovered}'),
                    ],
                  ),
                );
              },
              itemCount: prov.topRec.length),
        ),
      ],
    );
  }
}
