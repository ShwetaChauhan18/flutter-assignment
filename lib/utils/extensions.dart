import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../flavors/flavor.dart';
import '../flavors/flavor_config.dart';
import '../values/app_colors.dart';

/// provides extension to get a dependency from provider
extension ContextExtension on BuildContext {
  void hideKeyboard() {
    final currentFocus = FocusScope.of(this);
    SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
    if (!currentFocus.hasPrimaryFocus) {
      FocusScope.of(this).requestFocus(FocusNode());
    }
  }

  void pop<T>([T? result]) => Navigator.pop<T>(this, result);

  void showSnackBar(String message) => ScaffoldMessenger.of(this)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: AppColors.colorPrimary,
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
}

/// provides extension to get a dependency from provider
extension StatefulWidgetExtension on State {
  /// returns object of type [T] from provider
  T provide<T>() => Provider.of<T>(context, listen: false);

  bool get isDev => FlavorConfig.of(context)!.flavor == Flavor.dev;
}

/// allows to create [MultiProvider] with less boilerplate
extension ProviderExtension<T> on Widget {
  Widget withProvider<P>(P provider) => Provider<P>(
        create: (_) => provider,
        child: this,
      );
}
