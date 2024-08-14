String formatDuration(Duration duration) {
  final mins = duration.inMinutes.remainder(60);
  final secs = duration.inSeconds.remainder(60);
  return '${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
}
