import 'package:flutter/material.dart';
import 'package:ncov_visual/provider/apiHelper.dart';
import '../screen_size.dart';
import 'highestVaccines.dart';

class HighListViewDosagesRates extends StatelessWidget {
  const HighListViewDosagesRates({
    @required this.prov,
    @required this.count,
  });

  final GlobalResponseHelper prov;
  final CountriesResponseHelper count;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Dosage Rates',
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
                                        '${flag(count.countriesList, prov.dailyVaccList[id].country)}') ??
                                    Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: ScreenSize.safeHeight * 1,
                            ),
                            Expanded(
                              child: Text(
                                '${prov.dailyVaccList[id].country}',
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
                        child: Text(retPace(prov.dailyVaccList[id].timeline["dailyPace"])),
                      ),
                    ],
                  ),
                );
              },
              itemCount: prov.dailyVaccList.length),
        ),
      ],
    );
  }
}

String retPace(int number) {
  if(number > 999999) return "${(number * 0.000001).toStringAsFixed(3)}M/day"; 
  else return "${(number * .001).toStringAsFixed(1)}k/day"; 
}