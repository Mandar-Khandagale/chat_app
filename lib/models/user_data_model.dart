class UserData {
  final String id;
  final String userName;
  final String userImg;

  UserData({
    required this.id,
    required this.userName,
    required this.userImg,
  });
}

List<UserData> users = [
  userGordon,
  userSalvatore,
  userSacha,
  userDeven,
  userSahil,
  userReuben,
  userNash,
];

UserData userGordon = UserData(
  id: 'gordon',
  userName: 'Gordon Hayes',
  userImg:
      'https://pbs.twimg.com/profile_images/1262058845192335360/Ys_-zu6W_400x400.jpg',
);

UserData userSalvatore = UserData(
  id: 'salvatore',
  userName: 'Salvatore Giordano',
  userImg:
      'https://pbs.twimg.com/profile_images/1252869649349238787/cKVPSIyG_400x400.jpg',
);

UserData userSacha = UserData(
  id: 'sacha',
  userName: 'Sacha Arbonel',
  userImg:
      'https://pbs.twimg.com/profile_images/1199684106193375232/IxA9XLuN_400x400.jpg',
);

UserData userDeven = UserData(
  id: 'deven',
  userName: 'Deven Joshi',
  userImg:
      'https://pbs.twimg.com/profile_images/1371411357459832832/vIy8TO9F_400x400.jpg',
);

UserData userSahil = UserData(
  id: 'sahil',
  userName: 'Sahil Kumar',
  userImg:
      'https://pbs.twimg.com/profile_images/1324766105127153664/q96TpY8I_400x400.jpg',
);

UserData userReuben = UserData(
  id: 'reuben',
  userName: 'Reuben Turner',
  userImg:
      'https://pbs.twimg.com/profile_images/1370571324578480130/UxBBI30i_400x400.jpg',
);

UserData userNash = UserData(
  id: 'nash',
  userName: 'Nash Ramdial',
  userImg:
      'https://pbs.twimg.com/profile_images/1436372495381172225/4wDDMuD8_400x400.jpg',
);
