import 'package:flutter/material.dart';
import 'package:weather/core/base/view/base_widget.dart';
import 'package:weather/ui/screens/splash/view_model/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, model, child) {
        return Scaffold(
          body: model.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox(),
        );
      },
    );
  }
}
