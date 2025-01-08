import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/presentation/bloc/doner/doner_bloc.dart';
import 'package:project1/presentation/screen/doner/widget/doner_content_widget.dart';

class GetAdonerScreen extends StatelessWidget {
  GetAdonerScreen({
    super.key,
  });

  final ValueNotifier<int> selectedIndex = ValueNotifier(-1);

  final List<String> bloodgroups = [
    'A+',
    'B+',
    'AB+',
    'A-',
    'B-',
    'AB-',
    'O+',
    'O-'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "select the blood group",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red.shade900,
      ),
      body: Column(children: [
        Container(
          width: double.infinity,
          height: 230,
          color: Colors.red.shade900,
          child: Center(
            child: ValueListenableBuilder(
              valueListenable: selectedIndex,
              builder: (context, value, child) => GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      selectedIndex.value = index;

                      context.read<DonerBloc>().add(
                          DonerSearch(donerBloodGroup: bloodgroups[index]));
                    },
                    child: Card(
                        color: selectedIndex.value == index
                            ? Colors.red.shade100
                            : Colors.red,
                        child: Center(
                            child: Text(
                          bloodgroups[index],
                          style: TextStyle(
                              color: selectedIndex.value == index
                                  ? Colors.red.shade900
                                  : Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ))),
                  );
                },
                itemCount: bloodgroups.length,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(child: DonerContentWidget()),
      ]),
    );
  }
}
