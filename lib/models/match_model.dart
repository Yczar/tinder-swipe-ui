class MatchModel {
  final String? name;
  final String? imageUrl;
  final String? country;
  final String? milesAway;

  MatchModel({
    this.name,
    this.imageUrl,
    this.country,
    this.milesAway,
  });
  static List<MatchModel> get matches => [
        MatchModel(
          name: 'Mimi',
          country: 'London',
          milesAway: '4.5',
          imageUrl:
              'https://mediaslide-europe.storage.googleapis.com/immmodels/pictures/1158/2588/profile-1651661863-5d65c4d8296a629efedda9658ddd8e12.jpg',
        ),
        MatchModel(
          name: 'Gbenga',
          country: 'Nigeria',
          milesAway: '2.5',
          imageUrl:
              'https://www.nairaland.com/attachments/7943871_callixobinnajr201810100004_jpegef83c268db2ea2ddf715df237e9a268a',
        ),
        MatchModel(
          name: 'Katy',
          country: 'USA',
          milesAway: '10.5',
          imageUrl:
              'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZmVtYWxlJTIwbW9kZWx8ZW58MHx8MHx8&w=1000&q=80',
        ),
        MatchModel(
          name: 'Kitana',
          country: 'USA',
          milesAway: '30.5',
          imageUrl:
              'https://imgix.ranker.com/user_node_img/119/2372200/original/wendy-starland-photo-u2?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=375',
        ),
        MatchModel(
          name: 'Arya',
          country: 'Nigeria',
          milesAway: '3.5',
          imageUrl:
              'https://pbs.twimg.com/media/EbOCnyKXsAEMu8A?format=png&name=360x360',
        ),
        MatchModel(
          name: 'Sola',
          country: 'Nigeria',
          milesAway: '5.5',
          imageUrl:
              'https://nigerianinformer.com/wp-content/uploads/2020/10/Anna-Banner.jpg',
        ),
        MatchModel(
          name: 'Kenneth',
          country: 'Kenya',
          milesAway: '10.5',
          imageUrl:
              'https://i.pinimg.com/originals/c2/71/62/c27162d7dc6173d1d8df7e258d4abd41.jpg',
        ),
        MatchModel(
          name: 'Mushema',
          country: 'Uganda',
          milesAway: '12.7',
          imageUrl:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Housen_Mushema_in_2022.jpg/800px-Housen_Mushema_in_2022.jpg',
        ),
      ];
}
