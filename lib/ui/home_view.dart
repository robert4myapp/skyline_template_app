import 'package:flutter/material.dart';
import 'package:skyline_template_app/core/utilities/constants.dart';
import 'package:skyline_template_app/viewmodels/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:skyline_template_app/locator.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => locator<HomeViewModel>(),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) => SafeArea(
          child: Scaffold(
            backgroundColor: kColorSkylineGreen,
            body: Column(
              children: [
                Container(
                  child: Center(child: Text("Skyline Flutter Template",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: kColorSkylineWhite),)),
                ),SizedBox(height: 10,),
                Container(child: Image.asset('assets/SkyLineLogo.png'),),
                RaisedButton(onPressed: () {
                  model.routeToTeacherView();
                }, textColor: kColorSkylineGreen,color: kColorSkyLineGrey, child: Text('Teacher View'),),
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
