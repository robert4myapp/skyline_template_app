import 'package:flutter/material.dart';
import 'package:skyline_template_app/viewmodels/teacher_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:skyline_template_app/locator.dart';
import 'package:skyline_template_app/core/utilities/constants.dart';

class TeacherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TeacherViewModel>(
      create: (context) => locator<TeacherViewModel>(),
      child: Consumer<TeacherViewModel>(
        builder: (context, model, child) => SafeArea(
          child: Scaffold(
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
                      final firstName = model.teachers[index].firstName ?? 'na';
                      final lastName = model.teachers[index].lastName ?? 'na';
                      final email = model.teachers[index].email ?? 'na';
                      return ListTile(tileColor: index%2 ==0 ? kColorSkyLineGrey : kColorSkylineDarkGrey,
                        title: Text('$firstName $lastName'),
                        subtitle: Text(email),
                      );
                    },
                    itemCount: model.teachers.length,
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        model.addTeacher();
                      },
                      textColor: kColorSkylineGreen,
                      color: kColorSkyLineGrey,
                      child: Text('Add Teacher'),
                    ),SizedBox(width: 5,),
                    RaisedButton(
                      onPressed: () {
                        model.routeToHomeView();
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
        ),
      ),
    );
  }
}
