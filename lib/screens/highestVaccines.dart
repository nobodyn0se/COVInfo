import 'package:flutter/material.dart';
import '../provider/coreClass.dart';
import 'package:ncov_visual/provider/apiHelper.dart';
import '../screen_size.dart';

class HighListViewVaccines extends StatelessWidget {
  const HighListViewVaccines({
    required this.prov,
    required this.count,
  });

  final GlobalResponseHelper prov;
  final CountriesResponseHelper count;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Highest Vaccinations',
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
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: ScreenSize.safeHeight * 2,
                              backgroundColor: Colors.black,
                              child: CircleAvatar(
                                radius: ScreenSize.safeHeight * 1.8,
                                backgroundImage: NetworkImage(
                                        '${flag(count.countriesList, prov.topVaccList[id].country)}'),
                              ),
                            ),
                            SizedBox(
                              width: ScreenSize.safeHeight * 1,
                            ),
                            Expanded(
                              child: Text(
                                '${prov.topVaccList[id].country}',
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(right: ScreenSize.safeWidth * 1),
                        child: Text(
                            '${prov.topVaccList[id].timeline!.values.elementAt(2)}'),
                      ),
                    ],
                  ),
                );
              },
              itemCount: prov.topVaccList.length),
        ),
      ],
    );
  }
}

String? flag(List<CountriesResponse> cList, String? country) =>
    cList.firstWhere((element) => element.country == country).flagURL;
