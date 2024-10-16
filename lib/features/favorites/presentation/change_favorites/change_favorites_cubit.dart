// import 'package:bloc/bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';

// part 'change_favorites_state.dart';

// class ChangeFavoritesCubit extends Cubit<ChangeFavoritesState> {
//   final MyFavoritesRepo favoritesRepo;
//   ChangeFavoritesCubit({required this.favoritesRepo})
//       : super(ChangeFavoritesInitial());

//   Future changeFavorite(context, int id) async {
//     BlocProvider.of<GetProductsCubit>(context).favorites[(id)] =
//         !BlocProvider.of<GetProductsCubit>(context).favorites[(id)]!;
//     emit(ChangeFavoritesSuccess(message: ''));
//     var results = await favoritesRepo.changeFavorites(id: id);
//     results.fold(
//         (failure) =>
//             emit(ChangeFavoritesFail(errorMessage: failure.errorMessage)),
//         (response) {
//       if (response.status == false) {
//         BlocProvider.of<GetProductsCubit>(context).favorites[(id)] =
//             !BlocProvider.of<GetProductsCubit>(context)
//                 .favorites[(id)]!;
//       }
//       return emit(ChangeFavoritesSuccess(message: response.message!));
//     });
//   }
// }
