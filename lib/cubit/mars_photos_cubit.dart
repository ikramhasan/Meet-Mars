import 'package:bloc/bloc.dart';
import 'package:meet_mars/core/failure.dart';
import 'package:meet_mars/models/mars_photos.dart';
import 'package:meet_mars/repository/nasa_api_repository.dart';
import 'package:meta/meta.dart';

part 'mars_photos_state.dart';

class MarsPhotosCubit extends Cubit<MarsPhotosState> {
  final NasaApiRepository _apiRepository;

  MarsPhotosCubit(this._apiRepository) : super(MarsPhotosLoading());

  Future<void> getRoverPhotos(String roverName) async {
    emit(MarsPhotosLoading());
    try {
      final MarsPhotos marsPhotos =
          await _apiRepository.getPhotoListFromApi(roverName);

      emit(MarsPhotosLoaded(marsPhotos));
    } on ServerFailure catch (e) {
      emit(MarsPhotosError(e.errorCode));
    }
  }
}
