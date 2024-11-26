import 'package:flutter/material.dart';
import 'info.dart'; // Ensure this imports the code

void main() {
  runApp(MaterialApp(
    home: RajkotTourPage(),
  ));
}

class RajkotTourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://via.placeholder.com/150', // Profile image placeholder
              ),
            ),
            SizedBox(width: 10),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.red),
                Text(
                  'Rajkot, Gujarat',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            Spacer(),
            Icon(Icons.notifications, color: Colors.black),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.filter_list),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),
              // Category buttons
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    categoryButton('All'),
                    categoryButton('Cultural'),
                    categoryButton('Natural'),
                    categoryButton('Historical'),
                    categoryButton('Restaurants'),
                    categoryButton('Hotels'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Recommendations
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recommendation',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    placeCard(
                      context,
                      'Atal Sarovar',
                      'Ring Road, KKV chowk',
                      'https://www.ccel.in/wp-content/uploads/2022/09/DJI_0925_1.jpg',
                      4.8,
                    ),
                    placeCard(
                      context,
                      'Watson Museum',
                      'Jubille Garden, Jawahar Road',
                      'https://media-cdn.tripadvisor.com/media/photo-s/11/0b/3a/3a/watson-museum.jpg',
                      4.7,
                    ),
                    placeCard(
                      context,
                      'Rotary International Dolls Museum',
                      'Nagrik Bank building, Rajkot',
                      'https://www.gujarattourism.com/content/dam/gujrattourism/images/june/Rottary-doll-Museum-banner.jpg',
                      4.9,
                    ),
                    placeCard(
                      context,
                      'Fun World',
                      'Race Course, Rajkot',
                      'https://funworldparks.com/wp-content/uploads/2023/09/banner-image.webp',
                      4.6,
                    ),
                    placeCard(
                      context,
                      'Gandhi Museum',
                      'Jubilee Garden',
                      'https://www.mkgandhi.org/images/mgm-rajkot.jpg',
                      4.8,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Popular Places
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Places',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 10),
              popularPlaceCard(
                context,
                'ISKCON Temple',
                'Kalawad Road',
                'https://iskconnews.org/media/images/2019/05-May/rajkot1.jpg',
                4.6,
              ),
              popularPlaceCard(
                context,
                'Ranjit Vilas Palace',
                'Vaedhman Nagar',
                'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Wankaner-palace.png/640px-Wankaner-palace.png',
                4.9,
              ),
              popularPlaceCard(
                context,
                'Eldorado Fun Park',
                'Rajkot-Jamnagar Highway',
                'https://content.jdmagicbox.com/comp/rajkot/dc/0281px281.x281.1230892064x3w4w3.dc/catalogue/the-eldorado-targhadia-rajkot-amusement-parks-3ufalxc.jpg',
                4.7,
              ),
              popularPlaceCard(
                context,
                'BAPS Mandir',
                'Kalawad Road',
                'https://blogger.googleusercontent.com/img/a/AVvXsEjqwngH1MGp_wliehZUcUxIreo46HNY0eYhNNZkuJ72394ZrCKRdaY4PQJFQLuThhCr-YMJxxn00RxRYjsfP0JL71yXiyug31-wsPdoYq4C4yFwtbIYUm4vCy_EwEfGt_-N32QP0IHALaH5zP4C-1xltv178ljRagi4Fc3MaYvVZ6wYDjTLUZwXYxH5=s16000',
                4.8,
              ),
              popularPlaceCard(
                context,
                'Pradhyuman Park',
                'Race-course Road',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSM5abhZ6YTi695jc4_1QCCIxarlzp8KKLhQ&s',
                4.5,
              ),
              popularPlaceCard(
                context,
                'Ishwariya Park',
                'Rajkot-Jamnagar Highway',
                'https://media-cdn.tripadvisor.com/media/photo-s/16/76/9b/6f/img-20190203-235746-661.jpg',
                4.8,
              ),
              popularPlaceCard(
                context,
                'Ramkrishna Ashram',
                'Jagnath Plot',
                'https://www.gujarattourism.com/content/dam/gujrattourism/images/religious-sites/ramkrishna-mission/RamKrishna-Mission-Banner.jpg',
                4.9,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[300],
          foregroundColor: Colors.black,
        ),
      ),
    );
  }

  Widget placeCard(BuildContext context, String name, String location, String imageUrl, double rating) {
    return GestureDetector(
      onTap: () {
        // Navigate to InfoScreen with place details
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TravelApp(), // Navigate to InfoScreen
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(location),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 16),
                Text(rating.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget popularPlaceCard(BuildContext context, String name, String location, String imageUrl, double rating) {
    return GestureDetector(
      onTap: () {
        // Navigate to InfoScreen with place details
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TravelApp(), // Navigate to InfoScreen
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                width: 120,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(location),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      Text(rating.toString()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
