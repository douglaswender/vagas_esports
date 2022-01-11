import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vagas_esports/src/pages/home/cubit/home_cubit.dart';
import 'package:vagas_esports/src/shared/theme/app_theme.dart';
import 'package:vagas_esports/src/shared/widgets/bottom_sheet_loading/bottom_sheet_loading.dart';
import 'package:vagas_esports/src/shared/widgets/filters_widget/checkbox_item.dart';
import 'package:vagas_esports/src/shared/widgets/filters_widget/filters_controller.dart';
import 'package:vagas_esports/src/shared/widgets/filters_widget/filters_widget.dart';
import 'package:vagas_esports/src/shared/widgets/horizontal_list_loading/horizontal_list_loading.dart';
import 'package:vagas_esports/src/shared/widgets/input_text/input_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeCubit> {
  List<CheckboxItem> options = [
    CheckboxItem(label: "Top", selected: false),
    CheckboxItem(label: "Jungle", selected: false),
    CheckboxItem(label: "Mid", selected: false),
    CheckboxItem(label: "Atirador", selected: false),
    CheckboxItem(label: "Suporte", selected: false),
    CheckboxItem(label: "Staff", selected: false),
  ];

  FiltersController? filterController;

  @override
  void initState() {
    controller.init();
    filterController = FiltersController(allOptions: options);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppTheme.sizes.s64),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppTheme.sizes.s8),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Vagas',
                    style: AppTheme.textStyles.header,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: AppTheme.sizes.s8),
                    child: TextButton(
                      onPressed: controller.filters,
                      child: Text(
                        'Filtros',
                        style: AppTheme.textStyles.buttonSecondary,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppTheme.sizes.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InputText(
              label: 'Pesquisar',
              hint: 'Nome, nick ou lane',
              onChanged: (value) {
                controller.searchText = value;
              },
              suffixIcon: Icons.search,
              onSuffixIconTap: () => print(filterController!.allSelectedItems),
            ),
            SizedBox(
              height: AppTheme.sizes.s16,
            ),
            Expanded(
              child: ListView(
                children: [
                  BlocBuilder(
                    bloc: controller,
                    builder: (_, state) {
                      if (state is HomeSuccess) {
                        if (state.isShowFilters!) {
                          return FiltersWidget(
                            controller: filterController!,
                            title: "Função",
                            subtitle: "Situação",
                            options: options,
                          );
                        }
                      } else {
                        return Container();
                      }
                      return Container();
                    },
                  ),
                  SizedBox(
                    height: AppTheme.sizes.s32,
                  ),
                  Text(
                    "Novas!",
                    style: AppTheme.textStyles.title,
                  ),
                  SizedBox(
                    height: AppTheme.sizes.s16,
                  ),
                  BlocBuilder(
                    bloc: controller,
                    builder: (context, state) {
                      if (state is HomeSuccess) {
                        return SizedBox(
                          height: 110,
                          child: ListView.builder(
                              itemCount: state.hotVacancies!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      right: AppTheme.sizes.s16),
                                  child: Container(
                                    width: 110.0,
                                    height: 110.0,
                                    color: Colors.white,
                                    child: Text(
                                        state.hotVacancies![index].contact!),
                                  ),
                                );
                              }),
                        );
                      } else if (state is HomeLoading) {
                        return HorizontalListLoading();
                      } else {
                        return Container();
                      }
                    },
                  ),
                  SizedBox(
                    height: AppTheme.sizes.s32,
                  ),
                  Text(
                    "Destaques!",
                    style: AppTheme.textStyles.title,
                  ),
                  SizedBox(
                    height: AppTheme.sizes.s16,
                  ),
                  BlocBuilder(
                    bloc: controller,
                    builder: (context, state) {
                      if (state is HomeSuccess) {
                        return SizedBox(
                          height: 110,
                          child: ListView.builder(
                              itemCount: state.topVacancies!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      right: AppTheme.sizes.s16),
                                  child: Container(
                                    width: 110.0,
                                    height: 110.0,
                                    color: Colors.white,
                                    child: Text(
                                        state.topVacancies![index].contact!),
                                  ),
                                );
                              }),
                        );
                      } else if (state is HomeLoading) {
                        return HorizontalListLoading();
                      } else {
                        return Container();
                      }
                    },
                  ),
                  SizedBox(
                    height: AppTheme.sizes.s32,
                  ),
                  Text(
                    "Todas vagas!",
                    style: AppTheme.textStyles.title,
                  ),
                  SizedBox(
                    height: AppTheme.sizes.s16,
                  ),
                  BlocBuilder(
                    bloc: controller,
                    builder: (context, state) {
                      if (state is HomeSuccess) {
                        return SizedBox(
                          height: 110,
                          child: ListView.builder(
                              itemCount: state.allVacancies!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      right: AppTheme.sizes.s16),
                                  child: Container(
                                    width: 110.0,
                                    height: 110.0,
                                    color: Colors.white,
                                    child: Text(
                                        state.allVacancies![index].contact!),
                                  ),
                                );
                              }),
                        );
                      } else if (state is HomeLoading) {
                        return HorizontalListLoading();
                      } else {
                        return Container();
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket), label: "Vagas"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Feed"),
        ],
      ),
      // bottomSheet: BlocBuilder<HomeCubit, HomeState>(
      //   bloc: controller,
      //   builder: (context, state) {
      //     if (state is HomeLoading) {
      //       return BottomSheetLoading();
      //     } else {
      //       return SizedBox();
      //     }
      //   },
      // ),
    );
  }
}
