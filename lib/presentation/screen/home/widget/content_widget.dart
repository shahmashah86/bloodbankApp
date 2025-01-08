import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/presentation/bloc/doner/doner_bloc.dart';
import 'package:project1/presentation/screen/widget/content.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    super.key,
  });

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
          return ListView.builder(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              itemBuilder: (context, index) {
                final document = state.DonersList[index];
                return Content(
                  document: document,
                  index: index,
                );
              },
              itemCount: state.DonersList.length);
        }

        return Text("initializing..");
      },
    );
  }
}
