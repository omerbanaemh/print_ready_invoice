part of 'localization_cubit.dart';

@immutable
sealed class LocalizationState {}

final class LocalizationInitial extends LocalizationState {}

final class LocalizationChanged extends LocalizationState {
  final String locale;

  LocalizationChanged(this.locale);
}
