part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<VacancyModel>? hotVacancies;
  final List<VacancyModel>? topVacancies;
  final List<VacancyModel>? allVacancies;
  final bool? isShowFilters;

  HomeSuccess({
    this.hotVacancies,
    this.topVacancies,
    this.allVacancies,
    this.isShowFilters = false,
  });
}

class HomeSuccessSearch extends HomeState {
  final List<VacancyModel>? allVacancies;
  final bool? isShowFilters;

  HomeSuccessSearch({
    this.allVacancies,
    this.isShowFilters = false,
  });
}
