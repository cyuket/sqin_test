import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sqin/locator.dart';
import 'package:sqin/viewmodels/base_model.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;

  /// Call back to trigger once view is built
  final Function(T) onModelReady;

  BaseView({this.builder, this.onModelReady});
  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = sl<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      // create: (context) => model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
