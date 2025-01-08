import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/presentation/bloc/doner/doner_bloc.dart';
import 'package:project1/presentation/screen/widget/content.dart';

class DonerContentWidget extends StatefulWidget {
  const DonerContentWidget({
    super.key,
  });

  @override
  State<DonerContentWidget> createState() => _DonerContentWidgetState();
}

class _DonerContentWidgetState extends State<DonerContentWidget> {
  @override
  void initState() {
    context.read<DonerBloc>().add(DonerSearch(
          donerBloodGroup: null,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DonerBloc, DonerState>(
      builder: (context, state) {
        if (state is DonerLoading) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (Text(
                  "Please wait...",
                  style: TextStyle(fontSize: 23),
                )),
                SizedBox(
                  width: 4,
                ),
                SizedBox(
                    height: 20, width: 20, child: CircularProgressIndicator())
              ],
            ),
          );
        }

        if (state is DonerLoaded) {
          if (state.selectedDonerList!.isNotEmpty) {
            return ListView.builder(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                itemBuilder: (context, index) {
                  final document = state.selectedDonerList![index];
                  // final document = datas[index];

                  return Content(
                    document: document,
                    index: index,
                  );
                },
                itemCount: state.selectedDonerList!.length);
          }

          if (state.selectedDonerList!.isEmpty && state.message == 'no') {
            return Text("selected  bloodgroup is unavailable");
          }
          if (state.selectedDonerList!.isEmpty &&
              state.message == "No group selected") {
            return Text("select a blood groups");
          }
        }

        return Text("initializing..");
      },
    );
  }
}
