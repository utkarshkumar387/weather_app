import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/modules/homepage/widgets/homepage_view.dart';
import 'package:weather_app/modules/weather_page/models/loading_model.dart';
import 'package:weather_app/redux/states/app_state.dart';

class HomepageViewConnector extends StatelessWidget {
  const HomepageViewConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      vm: () => _ViewModelFactory(this),
      builder: (context, snapshot) {
        return const HomepageView();
      },
    );
  }
}

class _ViewModel extends Vm {
  final LoadingStatus loadingStatus;
  _ViewModel({
    required this.loadingStatus,
  }) : super(
          equals: [
            loadingStatus,
          ],
        );
}

class _ViewModelFactory extends VmFactory<AppState, HomepageViewConnector> {
  _ViewModelFactory(HomepageViewConnector widget) : super(widget);

  @override
  _ViewModel fromStore() => _ViewModel(
        loadingStatus: LoadingStatus.success,
      );
}
