import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'app_config.dart';
import 'flavors/flavor.dart';
import 'flavors/flavor_config.dart';
import 'flavors/flavor_values.dart';
import 'locator.dart';
import 'utils/helpers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setAppOrientation();
  setupLogging();
  debugPaintSizeEnabled = false;
  setupLocator();
  runApp(const FlavoredApp());
}

class FlavoredApp extends StatelessWidget {
  const FlavoredApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlavorConfig(
      flavor: Flavor.uat,
      values: FlavorValues(
        baseUrl: '',
      ),
      child: const AppConfig(),
    );
  }
}
