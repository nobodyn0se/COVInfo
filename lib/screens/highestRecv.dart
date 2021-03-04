import 'package:flutter/material.dart';
import 'package:ncov_visual/provider/apiHelper.dart';

import '../screen_size.dart';

class HighListViewRecoveries extends StatelessWidget {
  const HighListViewRecoveries({
    @required this.prov,
  });

  final GlobalResponseHelper prov;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                                NetworkImage('${prov.hRecover[id].flagURL}') ??
                                    Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: ScreenSize.safeHeight * 1,
                        ),
                        Expanded(
                          child: Text(
                            '${prov.hRecover[id].country}',
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text('+${prov.hRecover[id].recovered}'),
                ],
              ),
            );
          },
          itemCount: prov.hRecover.length),
    );
  }
}