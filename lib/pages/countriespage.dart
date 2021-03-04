import 'package:flutter/material.dart';
import 'package:ncov_visual/provider/apiHelper.dart';
import 'package:ncov_visual/screen_size.dart';
import 'package:provider/provider.dart';

class CountriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<CountriesResponseHelper>(context);
    //print(prov.obj.length);
    return (prov.bufferStatus)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            padding: EdgeInsets.all(ScreenSize.safeHeight * 1),
            itemCount: prov.countriesList.length,
            itemBuilder: (context, id) {
              var uid = prov.countriesList[id];
              return Card(
                borderOnForeground: true,
                elevation: ScreenSize.safeHeight * 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: ScreenSize.safeHeight * 4,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            radius: ScreenSize.safeHeight * 3.6,
                            backgroundImage:
                                NetworkImage(uid.flagURL),
                          ), //inner
                        ),
                        SizedBox(
                          width: ScreenSize.safeWidth * 2,
                        ),
                        Text(
                          '${uid.country}\n\n'
                          'Active: ${uid.active}',
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ),

                    // Column(    edit this for better UI 
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     RowWithNumbers(ic: Icons.group, disp: uid.cases),
                    //     RowWithNumbers(
                    //         ic: Icons.airline_seat_flat_angled,
                    //         disp: uid.deaths),
                    //     RowWithNumbers(
                    //       disp: uid.recovered,
                    //       ic: Icons.thumb_up,
                    //     ), //recovery
                    //   ],
                    // )

                  ], //outer children
                ),
              );
            },
          );
  }
}

class RowWithNumbers extends StatelessWidget {
  const RowWithNumbers({@required this.ic, @required this.disp});
  final IconData ic;
  final int disp;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          ic,
          size: ScreenSize.safeHeight * 2,
        ),
        Text(
          '$disp\n',
          style: TextStyle(
            fontSize: ScreenSize.safeHeight * 2,
          ),
          //'Deaths: ${uid.deaths}\n'
          //'Recoveries: ${uid.recovered}',
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
