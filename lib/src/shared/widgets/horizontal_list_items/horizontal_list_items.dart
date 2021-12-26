// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:vagas_esports/src/shared/theme/app_theme.dart';
// import 'package:vagas_esports/src/shared/widgets/horizontal_list_loading/horizontal_list_loading.dart';

// class HorizontalListItem<T, S> extends StatelessWidget {
//   final T controller;
//   final S state;

//   const HorizontalListItem(
//       {Key? key, required this.controller, required this.state})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           "Todas vagas!",
//           style: AppTheme.textStyles.title,
//         ),
//         SizedBox(
//           height: AppTheme.sizes.s16,
//         ),
//         BlocBuilder(
//           bloc: controller,
//           builder: (context, state) {
//             if (state is controller.state) {
//               return SizedBox(
//                 height: 110,
//                 child: ListView.builder(
//                     itemCount: state.allVacancies!.length,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: EdgeInsets.only(right: AppTheme.sizes.s16),
//                         child: Container(
//                           width: 110.0,
//                           height: 110.0,
//                           color: Colors.white,
//                           child: Text(state.hotVacancies![index].contact!),
//                         ),
//                       );
//                     }),
//               );
//             } else if (state is HomeLoading) {
//               return HorizontalListLoading();
//             } else {
//               return Container();
//             }
//           },
//         )
//       ],
//     );
//   }
// }
