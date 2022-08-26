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
  'https://safeimagekit.com/picture.png',
);

UserData userDeven = UserData(
  id: 'deven',
  userName: 'Deven Joshi',
  userImg:
      'https://i.pinimg.com/474x/17/c0/7f/17c07f9dfbd51291d225f73f48e32ec7.jpg',
);

UserData userSahil = UserData(
  id: 'sahil',
  userName: 'Sahil Kumar',
  userImg:
      'https://pbs.twimg.com/profile_images/1554425711624077314/m8eFjwEg_400x400.jpg',
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
      'https://upload.wikimedia.org/wikipedia/commons/b/be/Vrp-400x400.jpg',
);
