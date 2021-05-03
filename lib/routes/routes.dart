import 'package:flutter/material.dart';

import 'package:band_names/pages/home_page.dart';
import 'package:band_names/pages/status_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    HomePage.pageRoute: (BuildContext context) => HomePage(), // '/'
    StatusPage.pageRoute: (BuildContext context) => StatusPage(),
  };
}
