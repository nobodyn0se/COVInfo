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
            //padding: EdgeInsets.all(ScreenSize.safeHeight * 1),
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
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenSize.safeWidth * 2,
                            horizontal: ScreenSize.safeWidth * 2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: ScreenSize.safeHeight * 4,
                              backgroundColor: Colors.black,
                              child: CircleAvatar(
                                radius: ScreenSize.safeHeight * 3.6,
                                backgroundImage: NetworkImage(uid.flagURL),
                              ), //inner
                            ),
                            SizedBox(
                              width: ScreenSize.safeWidth * 2,
                            ),
                            Expanded(
                              child: Text(
                                '${uid.country}\n'
                                        'A: ${uid.active} ' +
                                    netActive(
                                        uid.todayCases, uid.todayRecovered),
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: ScreenSize.safeWidth*1),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: 'Courier',
                            fontSize: ScreenSize.safeHeight * 2,
                            fontWeight: FontWeight.w900,
                          ),
                          children: [
                            TextSpan(
                                text: 'C: ${uid.cases}\n',
                                style: TextStyle(color: Colors.blue[800])),
                            TextSpan(
                              text: 'D: ${uid.deaths}\n',
                              style: TextStyle(color: Colors.red[800]),
                            ),
                            TextSpan(
                              text: 'R: ${uid.recovered}',
                              style: TextStyle(color: Colors.lightGreen[800]),
                            ),
                          ],
                        ),
                      ),
                    ),
          
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

String netActive(int newCases, int newRec) {
  final net = newCases - newRec;

  if (net == 0)
    return '';
  else if (net > 0) return '(+$net)'; 
  else return '(-$net)'; 
}
