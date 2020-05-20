import 'package:equatable/equatable.dart';

/// Bloc state
abstract class GlobalState extends Equatable {
  const GlobalState();
}

/// Called when bloc is started
class InitialState extends GlobalState {
  @override
  List<Object> get props => [];
}

/// Called when bloc is loading or not
class LoadingState extends GlobalState {
  final bool isLoading;

  LoadingState(this.isLoading);

  @override
  List<Object> get props => [isLoading];
}

/// Called when bloc fails
class ErrorState extends GlobalState {
  final String reason;

  ErrorState(this.reason);

  @override
  List<Object> get props => [reason];
}

/// Called when bloc succeeds
class SuccessState<T> extends GlobalState {
  final T data;

  SuccessState(this.data);

  @override
  List<Object> get props => [data];
}
