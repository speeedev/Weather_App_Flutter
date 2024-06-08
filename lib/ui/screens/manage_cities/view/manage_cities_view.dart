import 'package:flutter/material.dart';
import 'package:weather/core/base/view/base_widget.dart';
import 'package:weather/core/extension/color_extension.dart';
import 'package:weather/core/extension/context_extension.dart';
import 'package:weather/ui/screens/manage_cities/view_model/manage_cities_view_model.dart';
import 'package:weather/ui/shared/base_body.dart';
import 'package:weather/ui/shared/widget/button.dart';
import 'package:weather/ui/shared/widget/ellipsis_text.dart';
import 'package:weather/ui/shared/widget/listview_container.dart';

class ManageCitiesView extends StatefulWidget {
  const ManageCitiesView({super.key});

  @override
  State<ManageCitiesView> createState() => _ManageCitiesViewState();
}

class _ManageCitiesViewState extends State<ManageCitiesView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: ManageCitiesViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, model, child) {
        return Scaffold(
          extendBodyBehindAppBar: !model.appbarTransparent,
          appBar: AppBar(
            title: const EllipsisText('Manage cities'),
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
            child: ListView(
              controller: model.scrollController,
              children: [
                SizedBox(height: context.lowValue),
                const _BuildSearchAndLocationIconButton(),
                SizedBox(height: context.mediumValue),
                _LocationsListView(model: model),
              ],
            ),
          ),
          floatingActionButton: const _BuildAddLocationButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}

class _BuildAddLocationButton extends StatelessWidget {
  const _BuildAddLocationButton();

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {},
      text: 'Add location',
      width: context.width * 0.5,
      height: context.highValue,
      isElevation: true,
    );
  }
}

class _LocationsListView extends StatelessWidget {
  ManageCitiesViewModel model;
  _LocationsListView({required this.model});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: model.locations.length,
      itemBuilder: (context, index) {
        final location = model.locations[index];
        return WeatherListViewContainer(
          title: location.name,
          subTitle: location.airQualityAndTemperature,
          trailingText: location.currentTemperature,
          isSelected: location.isSelected,
        );
      },
    );
  }
}

class _BuildSearchAndLocationIconButton extends StatelessWidget {
  const _BuildSearchAndLocationIconButton();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search location',
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
        ),
        SizedBox(width: context.lowValue),
        IconButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(12),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              context.colors.tertiary,
            ),
          ),
          icon: const Icon(Icons.location_on),
          onPressed: () {},
        ),
      ],
    );
  }
}
