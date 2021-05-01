import 'package:flutter/material.dart';

import 'package:band_names/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    HomePage.pageName: (BuildContext context) => HomePage(), // '/'
  };
}
