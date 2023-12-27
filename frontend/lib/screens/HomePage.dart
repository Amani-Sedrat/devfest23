import 'package:flutter/material.dart';
import 'package:frontend/shared/components.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                navbar(),
                Container(
                  height: 100,
                  width: 500,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Serious cases',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SeriousCasesPage()),
                        );
                      },
                      child: Text(
                        'View More',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                HorizontalCardList(),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Stories',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StoriesPage()),
                        );
                      },
                      child: Text(
                        'View More',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                PostCard(
                  profileImageUrl: 'profile_image_url_1',
                  imageUrl: 'image_url_1',
                  caption:
                      'Gaza wounded are splitting the sunlight! An injured Palestinian in the hospital bed trying to getsome sunlight after the little injured girl finished fromexposing to the sunlight.',
                ),
                SizedBox(height: 10),
                PostCard(
                  profileImageUrl: 'profile_image_url_2',
                  caption:
                      ' Hamas: "For 78 days, the Zionist occupation has continued its genocidal war against our Palestinian people in the Gaza Strip with American support and weapons, amid global silence and inaction to stop and prevent its continuation.To date, over 21,000 martyrs have fallen, and more than 56,000 have been wounded and injured, most of them women and children. We mourn the souls of our noble martyrs and pray to Allah Almighty for the speedy recovery of the wounded and sick, and for freedom for the prisoners and detainees.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SeriousCasesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serious Cases'),
      ),
      body: Center(
        child: Text('This is the SeriousCases Page'),
      ),
    );
  }
}

class StoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stories'),
      ),
      body: Center(
        child: Text('This is the Stories Page'),
      ),
    );
  }
}

class HorizontalCardList extends StatefulWidget {
  @override
  _HorizontalCardListState createState() => _HorizontalCardListState();
}

class _HorizontalCardListState extends State<HorizontalCardList> {
  List<String> cardTitles = ['Card 1', 'Card 2', 'Card 3']; // Initial cards
  List<String> cardImgs = [
    'assets/serious cases1.png',
    'assets/serious cases2.png',
    'assets/serious cases3.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: null, // Set itemCount to null for infinite scroll
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10.0),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(20)),
              // padding: EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/serious cases1.png',
              ),
            ),
          );
        },
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String profileImageUrl;
  final String? imageUrl;
  final String caption;

  PostCard({
    required this.profileImageUrl,
    this.imageUrl,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(profileImageUrl),
                  radius: 20,
                ),
                SizedBox(width: 8),
                Text(
                  'motaz _azaiza',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              caption,
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            if (imageUrl != null)
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('assets/mmotazA.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
