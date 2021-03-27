import 'package:flutter/material.dart';
import 'package:ncov_visual/pages/mainpage.dart';
import 'package:ncov_visual/provider/apiHelper.dart';
import '../screen_size.dart';

class HighListViewTests extends StatelessWidget {
  const HighListViewTests({
    required this.prov,
  });

  final GlobalResponseHelper prov;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Highest Tests',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: ScreenSize.safeHeight * 27,
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
                      buildLeadingRow(id, prov.hTests),
                      Padding(
                        padding:
                            EdgeInsets.only(right: ScreenSize.safeWidth * 1),
                        child: Text('${prov.hTests[id].tests}'),
                      ),
                    ],
                  ),
                );
              },
              itemCount: prov.hTests.length),
        ),
      ],
    );
  }
}
