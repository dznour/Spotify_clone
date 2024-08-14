import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/get_fav_songs_cubit/get_fav_songs_cubit.dart';
import 'fav_songs_list_builder.dart';
import 'profile_heading_builder.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileHeadingBuilder(),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'My Favorite Songs',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: BlocProvider(
                create: (context) => GetFavSongsCubit()..getFavSongs(),
                child: const FavSongsListBuilder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
