import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vagas_esports/src/shared/theme/app_theme.dart';

class HorizontalListLoading extends StatelessWidget {
  const HorizontalListLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: AppTheme.colors.greyInput,
              highlightColor: AppTheme.colors.grey,
              enabled: true,
              child: SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, __) => Padding(
                    padding: EdgeInsets.only(right: AppTheme.sizes.s16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 110.0,
                          height: 110.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  itemCount: 4,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
