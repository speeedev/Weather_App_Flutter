import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/base/view/base_widget.dart';
import 'package:weather/core/extension/color_extension.dart';
import 'package:weather/core/extension/context_extension.dart';
import 'package:weather/ui/screens/next_7_days/view_model/next_7_days_view_model.dart';
import 'package:weather/ui/shared/base_body.dart';
import 'package:weather/ui/shared/widget/appbar_with_toolbar_height.dart';
import 'package:weather/ui/shared/widget/listview_container.dart';

class Next7DaysView extends StatelessWidget {
  const Next7DaysView({Key? key});

  @override
  Widget build(BuildContext context) {
    return BaseView<Next7DaysViewModel>(
      viewModel: Next7DaysViewModel(),
      onModelReady: (model) => model.init(),
      onPageBuilder: (context, model, child) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Next 7 Days'),
          flexibleSpace: !model.appbarTransparent
              ? null
              : AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: context.colors.scaffoldBackground,
                    ),
                  ),
                ),
        ),
        body: BaseBody(
          padding: context.paddingMediumHorizontal,
          gradientBackground: true,
          child: SingleChildScrollView(
            controller: model.scrollController,
            child: Column(
              children: [
                AppBarWithToolbarHeight(),
                SizedBox(height: context.lowValue),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: model.weeklyForecast.length,
                  itemBuilder: (context, index) {
                    final dailyForecast = model.weeklyForecast[index];
                    String title;
                    if (index == 0) {
                      title = 'Yesterday';
                    } else if (index == 1) {
                      title = 'Today';
                    } else if (index == 2) {
                      title = 'Tomorrow';
                    } else {
                      title = DateFormat.EEEE().format(dailyForecast.date);
                    }
                    return WeatherListViewContainer(
                      title: title,
                      subTitle:
                          "${dailyForecast.date.month}/${dailyForecast.date.day}",
                      subTitleOpacityLow: true,
                      trailingText: '${dailyForecast.temperature}°C',
                      isSelected: index == 1,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
