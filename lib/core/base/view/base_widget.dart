import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child)
      onPageBuilder;
  final T viewModel;
  final Function(T) onModelReady;

  const BaseView({
    super.key,
    required this.viewModel,
    required this.onModelReady,
    required this.onPageBuilder,
  });

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  late T model;

  @override
  void initState() {
    super.initState();
    model = widget.viewModel;
    widget.onModelReady(model);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(
        builder: widget.onPageBuilder,
      ),
    );
  }
}
