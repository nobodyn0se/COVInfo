import 'package:flutter/material.dart';
import 'package:ncov_visual/provider/apiHelper.dart';
import '../screen_size.dart';

class TopListViewActive extends StatelessWidget {
  const TopListViewActive({
    @required this.prov,
  });

  final GlobalResponseHelper prov;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Highest Active',
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
                                    NetworkImage('${prov.topAct[id].flagURL}') ?? Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: ScreenSize.safeHeight * 1,
                            ),
                            Expanded(
                              child: Text(
                                '${prov.topAct[id].country}',
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text('+${prov.topAct[id].active}'),
                    ],
                  ),
                );
              },
              itemCount: prov.topAct.length),
        ),
      ],
    );
  }
}
