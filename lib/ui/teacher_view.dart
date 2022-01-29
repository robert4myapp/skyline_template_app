import 'package:flutter/material.dart';
import 'package:skyline_template_app/viewmodels/teacher_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:skyline_template_app/core/utilities/constants.dart';
import 'package:stacked/stacked.dart';

class TeacherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TeacherViewModel>.reactive(
      viewModelBuilder: () => TeacherViewModel(),
      disposeViewModel: false,
      onModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) => Scaffold(
            backgroundColor: kColorSkylineGreen,
            body: Column(
              children: [
                Container(
                  child: Center(
                      child: Text(
                    "Teachers Page",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: kColorSkylineWhite),
                  )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  height: 500,
                  color: kColorSkyLineGrey,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final firstName = viewModel.teachers[index].firstName ?? 'na';
                      final lastName = viewModel.teachers[index].lastName ?? 'na';
                      final email = viewModel.teachers[index].email ?? 'na';
                      return ListTile(tileColor: index%2 ==0 ? kColorSkyLineGrey : kColorSkylineDarkGrey,
                        title: Text('$firstName $lastName'),
                        subtitle: Text(email),
                      );
                    },
                    itemCount: viewModel.teachers.length,
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        viewModel.addTeacher();
                      },
                      textColor: kColorSkylineGreen,
                      color: kColorSkyLineGrey,
                      child: Text('Add Teacher'),
                    ),SizedBox(width: 5,),
                    RaisedButton(
                      onPressed: () {
                        viewModel.routeToHomeView();
                      },
                      textColor: kColorSkylineGreen,
                      color: kColorSkyLineGrey,
                      child: Text('Return to HomeView'),
                    ),
                  ],
                ),
              ],
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
    );
  }
}
