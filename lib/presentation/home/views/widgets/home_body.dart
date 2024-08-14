import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/appbar/basic_app_bar.dart';
import '../../../../core/configs/assets/app_vectors.dart';
import '../../../../core/utils/app_router.dart';
import '../../cubits/get_playlist_cubit/get_playlist_cubit.dart';
import '../../cubits/get_songs_cubit/get_songs_cubit.dart';
import 'get_playlist_list_view_builder.dart';
import 'home_body_header.dart';
import 'home_tabs.dart';
import 'get_songs_list_view_builder.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BasicAppBar(
              hideBack: false,
              title: SvgPicture.asset(
                AppVectors.kLogo,
                height: 40,
              ),
              actions: IconButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kProfileView);
                },
                icon: const Icon(FontAwesomeIcons.user),
              ),
            ),
            const HomeBodyHeader(),
            const SizedBox(
              height: 20,
            ),
            const HomeTabs(),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.28,
              child: BlocProvider(
                create: (context) => GetSongsCubit()..getSongs(),
                child: const GetSongsListViewBuilder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Playlist',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  'See More',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xffC6C6C6)),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: BlocProvider(
                create: (context) => GetPlaylistCubit()..getPlaylist(),
                child: const GetPlaylistListViewBuilder(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
