import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vagas_esports/src/shared/data/models/vacancy_model.dart';
import 'package:vagas_esports/src/shared/widgets/filters_widget/checkbox_item.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  //TODO: Home Repository
  //final HomeRepository repository;
  HomeCubit() : super(HomeInitial());

  String searchText = "";
  bool showFilters = false;
  late List<VacancyModel> hot;
  late List<VacancyModel> top;
  late List<VacancyModel> all;

  Future<void> init() async {
    emit(HomeLoading());
    hot = await getHotVacancies();
    top = await getTopVacancies();
    all = await getAllVacancies();
    emit(HomeSuccess(allVacancies: all, topVacancies: top, hotVacancies: hot));
  }

  void filters() {
    showFilters = !showFilters;
    emit(HomeSuccess(
      allVacancies: all,
      topVacancies: top,
      hotVacancies: hot,
      isShowFilters: showFilters,
    ));
  }

  Future<List<VacancyModel>> getHotVacancies() async {
    await Future.delayed(Duration(seconds: 1));
    final response =
        (mockHot['data'] as List).map((e) => VacancyModel.fromMap(e)).toList();

    return response;
  }

  Future<List<VacancyModel>> getTopVacancies() async {
    await Future.delayed(Duration(seconds: 1));
    final response =
        (mockTop['data'] as List).map((e) => VacancyModel.fromMap(e)).toList();

    return response;
  }

  Future<List<VacancyModel>> getAllVacancies() async {
    await Future.delayed(Duration(seconds: 1));
    final response =
        (mockAll['data'] as List).map((e) => VacancyModel.fromMap(e)).toList();

    return response;
  }

  Future<List<VacancyModel>> filterVacancies(
    String text,
    List<CheckboxItem> filters,
  ) async {
    emit(HomeLoading());
    await Future.delayed(Duration(seconds: 2));
    final response =
        (mockAll['data'] as List).map((e) => VacancyModel.fromMap(e)).toList();
    emit(HomeSuccessSearch(
      allVacancies: response,
      isShowFilters: false,
    ));

    return response;
  }
}

final mockAll = {
  "status": 200,
  "data": [
    {
      "user": {
        "email": "dglswender@gmail.com",
        "id": "xyz2020",
      },
      "rank": "Platina 1",
      "contact": "douglaswender#6604"
    },
    {
      "user": {
        "email": "dglswender@gmail.com",
        "id": "xyz2020",
      },
      "rank": "Platina 1",
      "contact": "douglaswender#6604"
    },
    {
      "user": {
        "email": "dglswender@gmail.com",
        "id": "xyz2020",
      },
      "rank": "Platina 1",
      "contact": "douglaswender#6604"
    },
  ],
};

final mockTop = {
  "status": 200,
  "data": [
    {
      "user": {
        "email": "dglswender@gmail.com",
        "id": "xyz2020",
      },
      "rank": "Platina 1",
      "contact": "douglaswender#6604"
    },
    {
      "user": {
        "email": "dglswender@gmail.com",
        "id": "xyz2020",
      },
      "rank": "Platina 1",
      "contact": "douglaswender#6604"
    },
  ],
};

final mockHot = {
  "status": 200,
  "data": [
    {
      "user": {
        "email": "dglswender@gmail.com",
        "id": "xyz2020",
      },
      "rank": "Platina 1",
      "contact": "douglaswender#6604"
    },
  ],
};
