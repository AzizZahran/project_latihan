import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    const String appTitle = 'Aplikasi Praktik Pertama'; //judul aplikasi
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const Center(
          child:Column(
            children: [
              ImageSection(
                image: 'image/20220406_063317.jpg', //foto konten dari direktori image
              ),
              TitleSection(
                name: 'Gunung Prau', //judul konten
                location: 'Dieng, Wonosobo', //lokasi konten
              ),
              ButtonSection(),
              TextSection(
                description: //deskripsi konten dari Gunung Prau
                'Gunung Prau terletak di Desa Patakbanteng, kawasan Dataran Tinggi Dieng, '
                    'Kabupaten Wonosobo dengan ketinggian 2.565 MDPL. Gunung Prau memiliki '
                    'jalur pendakian yang relatif mudah dan cukup jelas '
                    'bagi para pendaki serta view yang istimewa menjadikan Gunung Prau '
                    'menjadi gunung favorit bagi para pendaki saat ini. ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star, //pemberian ikon bintang
            color: Colors.red[500], //pemberian warna merah pada bintang
          ),
          const Text('69'), //penulisan faforit disamping bintang merah
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText( //penulisan tombol telepon dan label CALL
            color: color,
            icon: Icons.call,
            label: 'CALL',
          ),
          ButtonWithText( //penulisan tombol rute dan label ROUTE
            color: color,
            icon: Icons.near_me,
            label: 'ROUTE',
          ),
          ButtonWithText( //penulisan tombol bagikan dan label SHARE
            color: color,
            icon: Icons.share,
            label: 'SHARE',
          ),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}