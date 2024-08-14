import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../common/widgets/error/custom_error_widget.dart';
import '../../../../common/widgets/loading/custom_loading_widget.dart';
import '../../../../core/configs/theme/app_colors.dart';
import '../../../../core/utils/functions.dart';
import '../../cubits/cubit/song_player_cubit.dart';

class SongPlayerSlider extends StatelessWidget {
  const SongPlayerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(
        builder: (context, state) {
      if (state is SongPlayerError) {
        return CustomErrorWidget(error: state.error);
      } else if (state is SongPlayerSuccess || state is SongPlayerChange) {
        return Column(
          children: [
            Slider(
              value: context
                  .read<SongPlayerCubit>()
                  .songPostion
                  .inSeconds
                  .toDouble(),
              min: 0,
              max: context
                  .read<SongPlayerCubit>()
                  .songDuration
                  .inSeconds
                  .toDouble(),
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatDuration(
                    context.read<SongPlayerCubit>().songPostion)),
                Text(formatDuration(
                    context.read<SongPlayerCubit>().songDuration)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                context.read<SongPlayerCubit>().playOrPauseSong();
              },
              child: Container(
                height: 80,
                width: 80,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.kPrimaryColor),
                child: Icon(context.read<SongPlayerCubit>().audioPlayer.playing
                    ? FontAwesomeIcons.pause
                    : FontAwesomeIcons.play),
              ),
            )
          ],
        );
      } else {
        return const CustomLoadingWidget(
          loadingMessage: 'Loading Song ',
        );
      }
    });
  }
}
