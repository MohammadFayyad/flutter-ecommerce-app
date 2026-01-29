import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkService {
  NetworkService(this._connectivity);

  final Connectivity _connectivity;

  Stream<bool> get status async* {
    yield await isConnected();
    yield* _connectivity.onConnectivityChanged.map(_mapResultsToStatus);
  }

  Future<bool> isConnected() async {
    final results = await _connectivity.checkConnectivity();
    return _mapResultsToStatus(results);
  }

  bool _mapResultsToStatus(List<ConnectivityResult> results) {
    return results.any(
      (r) =>
          r == ConnectivityResult.mobile ||
          r == ConnectivityResult.wifi ||
          r == ConnectivityResult.ethernet,
    );
  }
}

class ConnectivityState {
  final bool isOnline;
  const ConnectivityState(this.isOnline);
}

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit(this.service) : super(const ConnectivityState(true)) {
    _subscription = service.status.listen(_onStatusChanged);
  }

  final NetworkService service;
  late final StreamSubscription<bool> _subscription;

  void _onStatusChanged(bool isOnline) {
    if (isClosed) return;
    emit(ConnectivityState(isOnline));
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
