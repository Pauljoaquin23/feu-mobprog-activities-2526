class ProfileInfo {
  const ProfileInfo(this.infoDescription, this.infoItems);

  final String infoDescription;
  final List<String> infoItems;

  List<String> getShuffledList() {
    final List<String> shuffledList = List.of(infoItems);
    shuffledList.shuffle();
    return shuffledList;
  }
}
