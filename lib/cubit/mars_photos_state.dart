part of 'mars_photos_cubit.dart';

@immutable
abstract class MarsPhotosState {
  const MarsPhotosState();
}

class MarsPhotosLoading extends MarsPhotosState {
  const MarsPhotosLoading();
}

class MarsPhotosLoaded extends MarsPhotosState {
  final MarsPhotos marsPhotos;

  const MarsPhotosLoaded(this.marsPhotos);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is MarsPhotosLoaded &&
      o.marsPhotos == marsPhotos;
  }

  @override
  int get hashCode => marsPhotos.hashCode;
}

class MarsPhotosError extends MarsPhotosState {
  final int errorCode;
  const MarsPhotosError(this.errorCode);
}
