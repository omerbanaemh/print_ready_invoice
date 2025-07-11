import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());
   String locale = 'en';

  void changeLocale(String newLocale) {

    if (newLocale != locale) {

      locale = newLocale;
      emit(LocalizationChanged(locale));
    }
  }


}
